require 'rails_helper'
RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'Alice') }
  let(:post1) { Post.create(title: 'Post 1', text: 'Post body', author: user) }
  let(:post2) { Post.create(title: 'Post 2', text: 'Post body', author: user) }
  let(:post3) { Post.create(title: 'Post 3', text: 'Post body', author: user) }
  let(:comment1) { Comment.create(author: user, post: post1, text: 'Comment body') }
  let(:comment2) { Comment.create(author: user, post: post2, text: 'Comment body') }
  let(:like1) { Like.create(author: user, post: post1) }
  let(:like2) { Like.create(author: user, post: post2) }

  describe 'validations' do
    it 'validates presence of name' do
      user = User.new(posts_counter: 0)
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'validates numericality of posts_counter' do
      user = User.new(name: 'John', posts_counter: 'not a number')
      expect(user).not_to be_valid
      expect(user.errors[:posts_counter]).to include('is not a number')

      user.posts_counter = -1
      expect(user).not_to be_valid
      expect(user.errors[:posts_counter]).to include('must be greater than or equal to 0')

      user.posts_counter = 0
      expect(user).to be_valid
    end
  end

  describe '#posts_counter' do
    it 'returns the number of posts by the user' do
      expect(user.posts_counter).to eq(0)
      post1
      expect(user.posts_counter).to eq(1)
      post2
      expect(user.posts_counter).to eq(2)
    end
  end

  describe '#get_recent_posts' do
    it 'returns the most recent posts up to the given count' do
      post1
      post2
      post3
      expect(user.get_recent_posts(1)).to eq([post3])
      expect(user.get_recent_posts(2)).to eq([post3, post2])
    end
  end
end
