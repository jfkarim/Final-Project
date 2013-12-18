require 'spec_helper'

describe Group do

  it { should have_one(:wall) }
  it { should have_many(:group_users) }
  it { should have_many(:users) }
  it { should have_many(:approved_group_users) }
  it { should have_many(:approved_users) }
  it { should have_many(:pending_group_users) }
  it { should have_many(:pending_users) }

end