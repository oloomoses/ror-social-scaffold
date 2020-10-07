require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is a valid post' do
    user = User.create(name: 'user', email: 'user@example.com', password: 'password')

    post = user.posts.create!(content: 'this is the test post')

    expect(post).to be_valid
  end

  it 'belongs to a user' do
    post = Post.reflect_on_association(:user)
    expect(post.macro).to eq(:belongs_to)
  end
end
