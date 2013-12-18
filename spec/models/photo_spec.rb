require 'spec_helper'

describe Photo do

  it { should belong_to(:user) }
  it { should belong_to(:album) }
  it { should have_many(:likes) }
  it { should have_many(:comments) }

end