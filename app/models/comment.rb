class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_post_comments_counter

  private

  def update_post_comments_counter
    post.update(CommentsCounter: Comment.where(post_id: post.id).count)
  end
end
