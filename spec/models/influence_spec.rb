require 'spec_helper'

describe Influence do

  it { should have_many(:users) }
  it { should have_many(:user_influences) }

end