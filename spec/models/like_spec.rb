require 'rails-helper'
describe Like, :type => :model do
  it { should belong_to(:user) }
end
