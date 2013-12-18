require 'spec_helper'

describe UserMedium do

  it { should belong_to(:user) }
  it { should belong_to(:medium) }

end