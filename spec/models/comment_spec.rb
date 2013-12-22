require 'spec_helper'

describe Comment do
  
  it { should belong_to(:user) }
  it { should belong_to(:commentable) }
  it { should have_many(:likes) }

end