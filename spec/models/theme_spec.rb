require 'spec_helper'

describe Theme do

  it { should have_many(:users) }
  it { should have_many(:user_themes) }

end