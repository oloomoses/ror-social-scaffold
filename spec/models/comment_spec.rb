require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'should should have many posts' do
    comment = User.reflect_on_association(:comments)
    expect(comment.macro).to eq(:has_many)
  end

  it 'should have many likes' do
    like = User.reflect_on_association(:likes)
    expect(like.macro).to eq(:has_many)
  end
end
