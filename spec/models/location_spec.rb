require 'spec_helper'

describe Location do

  it { should have_many(:users) }
  it { should have_many(:user_locations) }

end