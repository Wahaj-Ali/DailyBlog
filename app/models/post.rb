class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  after_save :update_author_posts_counter

  validates :Title, presence: true, length: { maximum: 250 }
  validates :CommentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :LikesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments(count = 5)
    comments.order(created_at: :desc).limit(count)
  end

  private

  def update_author_posts_counter
    author.update(posts_counter: Post.where(author_id: author.id).count)
  end
end
