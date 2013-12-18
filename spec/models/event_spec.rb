require 'spec_helper'

describe Event do

  it { should have_one(:wall) }
  it { should have_many(:event_users) }
  it { should have_many(:users) }
  it { should have_many(:going_event_users) }
  it { should have_many(:going_users) }
  it { should have_many(:maybe_event_users) }
  it { should have_many(:maybe_users) }
  it { should have_many(:declined_event_users) }
  it { should have_many(:declined_users) }
  it { should have_many(:pending_event_users) }
  it { should have_many(:pending_users) }

end