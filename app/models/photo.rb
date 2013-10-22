require 'addressable/uri'

class Photo < ActiveRecord::Base
  attr_accessible :picture, :location, :description, :album_id, :user_id, :latitude, :longitude

  validates :picture, :user_id, presence: true

  belongs_to :album
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  has_attached_file :picture, styles: {
    show: "500x500>",
    standard: "200x200>",
    icon: "50x50>"
  }

  def lat_lng
    url = Addressable::URI.new(
      :scheme => "https",
      :host => "maps.googleapis.com",
      :path => "/maps/api/geocode/json",
      :query_values => {
        :address => self.location,
        :sensor => "false"
      }).to_s

    response = JSON.parse(RestClient.get(url))
    top_result = response["results"].first
    coords = top_result["geometry"]["location"].values_at("lat", "lng")

    self.latitude = coords[0]
    self.longitude = coords[1]
  end

end
