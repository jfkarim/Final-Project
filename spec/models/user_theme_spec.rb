require 'spec_helper'

describe UserTheme do

  it { should belong_to(:user) }
  it { should belong_to(:theme) }

end