class User < ApplicationRecord
  has_many :posts

  def posts_counter
    posts.count
  end
end