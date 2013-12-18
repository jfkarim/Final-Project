require 'spec_helper'

describe Medium do

  it { should have_many(:users) }
  it { should have_many(:user_media) }

end