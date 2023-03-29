class AddDetailsToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :Title, :string
    add_column :posts, :Text, :string
    add_column :posts, :CommentsCounter, :integer
    add_column :posts, :LikesCounter, :integer
  end
end
