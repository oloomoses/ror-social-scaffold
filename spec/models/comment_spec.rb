require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'a comment belongs to a post' do
    comment = Comment.reflect_on_association(:post)
    expect(comment.macro).to eq(:belongs_to)
  end

  it 'should belong to a user' do
    comment = Comment.reflect_on_association(:user)
    expect(comment.macro).to eq(:belongs_to)
  end
end
