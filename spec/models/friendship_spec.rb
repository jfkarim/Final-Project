require 'spec_helper'

describe Friendship do

  it { should belong_to(:in_friend) }
  it { should belong_to(:out_friend) }

end