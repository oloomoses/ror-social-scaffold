require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'User',
      email: 'teste@gmail.com',
      password: 123_456
    )
  end

  context 'User Model' do
    it 'is not valid without name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is invalid with a name bigger than 20 characteres' do
      subject.name = 'asdfgfkgjfdoigjfdoigfjiofsjdfdklsfjdsfgsidjfdsgjhisodgjsdoifjsdoig'
      expect(subject).to_not be_valid
    end

    it 'is not valid with a password smaller than 6 characteres' do
      subject.password = 123
      expect(subject).to_not be_valid
    end

    it 'is valid with a password that is 6 characteres or more' do
      subject.password = 123_456_789
      expect(subject).to be_valid
    end

    it 'is not valid without password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end

  context 'associations tests' do
    it 'should have many posts' do
      post = User.reflect_on_association(:posts)
      expect(post.macro).to eq(:has_many)
    end

    it 'should have many Comments' do
      comment = User.reflect_on_association(:comments)
      expect(comment.macro).to eq(:has_many)
    end

    it 'should have many likes' do
      like = User.reflect_on_association(:likes)
      expect(like.macro).to eq(:has_many)
    end

    it 'should have many friendships' do
      friend = User.reflect_on_association(:friendships)
      expect(friend.macro).to eq(:has_many)
    end

    it 'should have many inverse_friendships' do
      inverse = User.reflect_on_association(:inverse_friendships)
      expect(inverse.macro).to eq(:has_many)
    end
  end
end
