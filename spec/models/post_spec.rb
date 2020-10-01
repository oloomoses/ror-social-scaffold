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
