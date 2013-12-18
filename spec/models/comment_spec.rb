require 'spec_helper'

describe Comment do

  it { should belong_to(:post) }
  it { should belong_to(:photo) }
  it { should belong_to(:user) }
  it { should belong_to(:album) }
  it { should have_many(:likes) }

end