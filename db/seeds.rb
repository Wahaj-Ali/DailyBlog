# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
# second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')
# second3 = User.create(name: 'hassan', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

# # Create 4 posts 
# first_post = Post.create(author: first_user, title: 'Hello one', text: 'This is my first post')
# second_post = Post.create(author: first_user, title: 'Hello two', text: 'This is my second post')
# third_post = Post.create(author: first_user, title: 'Hello tree', text: 'This is my third post')
# fours_post = Post.create(author: first_user, title: 'Hello four', text: 'This is my fours post')
# fours_5 = Post.create(author: second3, title: 'Test test', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vestibulum ultrices ex, eu auctor nulla malesuada ut. Aliquam sollicitudin dolor eu enim interdum, a iaculis ante mattis. Integer sit amet lorem nec tellus lacinia semper.')

# # Add 6 comments
# Comment.create(post: first_post, author: second_user, text: 'Hi comment 1' )
# Comment.create(post: first_post, author: second_user, text: 'Hi comment 2' )
# Comment.create(post: first_post, author: second_user, text: 'Hi comment 3' )
# Comment.create(post: first_post, author: second_user, text: 'Hi comment 4' )
# Comment.create(post: first_post, author: second_user, text: 'Hi comment 5' )
# Comment.create(post: first_post, author: second_user, text: 'Hi comment 6' )