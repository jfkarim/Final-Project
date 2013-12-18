require 'spec_helper'

describe UserInfluence do

  it { should belong_to(:user) }
  it { should belong_to(:influence) }

end