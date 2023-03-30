class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def comments_counter
    comments.count
  end

  def likes_counter
    likes.count
  end
end