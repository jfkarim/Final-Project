require 'spec_helper'

describe Wall do

  it { should belong_to(:wallable) }
  it { should have_many(:posts) }

end