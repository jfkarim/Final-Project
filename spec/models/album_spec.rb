require 'spec_helper'

describe Album do

  it { should belong_to(:user) }
  it { should have_many(:photos) }
  it { should have_many(:likes) }
  it { should have_many(:comments) }

end