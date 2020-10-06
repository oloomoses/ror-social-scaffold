require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'belongs to user' do
    like = Like.reflect_on_association(:user)
    expect(like.macro).to eq(:belongs_to)
  end

  it 'belongs to post' do
    like = Like.reflect_on_association(:post)
    expect(like.macro).to eq(:belongs_to)
  end
end
