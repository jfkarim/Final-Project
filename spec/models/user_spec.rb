require 'spec_helper'

describe User do

  it { should have_one(:wall) }
  it { should have_many(:user_media) }
  it { should have_many(:media) }
  it { should have_many(:user_influences) }
  it { should have_many(:influences) }
  it { should have_many(:user_locations) }
  it { should have_many(:locations) }
  it { should have_many(:user_themes) }
  it { should have_many(:friendships) }
  it { should have_many(:approved_friendships) }
  it { should have_many(:friends) }
  it { should have_many(:pending_friendships) }
  it { should have_many(:pending_friends) }
  it { should have_many(:group_users) }
  it { should have_many(:groups) }
  it { should have_many(:approved_group_users) }
  it { should have_many(:approved_groups) }
  it { should have_many(:pending_group_users) }
  it { should have_many(:pending_groups) }
  it { should have_many(:event_users) }
  it { should have_many(:events) }
  it { should have_many(:pending_event_users) }
  it { should have_many(:pending_events) }
  it { should have_many(:going_event_users) }
  it { should have_many(:going_events) }
  it { should have_many(:photos) }
  it { should have_many(:albums) }
  it { should have_many(:likes) }
  it { should have_many(:comments) }

end