require 'spec_helper'

describe Like do

  it { should belong_to(:likeable) }
  it { should belong_to(:user) }

end