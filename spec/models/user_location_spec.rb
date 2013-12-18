require 'spec_helper'

describe UserLocation do

  it { should belong_to(:user) }
  it { should belong_to(:location) }

end