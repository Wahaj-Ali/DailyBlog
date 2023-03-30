class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  after_save :update_author_posts_counter

  def get_recent_comments(count = 5)
    comments.order(created_at: :desc).limit(count)
  end

  private

  def update_author_posts_counter
    author.update(posts_counter: Post.where(author_id).count)
  end
end