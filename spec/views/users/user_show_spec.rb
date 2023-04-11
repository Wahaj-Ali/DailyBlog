require 'rails_helper'

RSpec.describe 'User show', type: :feature do
  before :each do
    @user1 = User.create(id: 5, name: 'Ali', photo: 'https://picsum.photos/300/200',
                         bio: 'Software Engineer from Pakistan', posts_counter: 12)
    @post1 = Post.create(id: 1, author: @user1, title: 'Title 1', text: 'This is my first post')
    @post2 = Post.create(author: @user1, title: 'Title 2', text: 'This is my second post')
    @post3 = Post.create(author: @user1, title: 'Title 3', text: 'This is my third post')
    visit user_path(@user1.id)
  end

  it 'Show user name' do
    expect(page).to have_content(@user1.name)
  end

  it 'I can see the profile picture for each user.' do
    expect(page).to have_css('img')
  end

  it 'Should see the number of posts the user has written' do
    expect(page).to have_content(@user1.posts_counter)
  end

  it 'Should see bio of the user' do
    expect(page).to have_content(@user1.bio)
  end

  it 'Should render the last 3 posts' do
    expect(page).to have_content(@post1.title)
    expect(page).to have_content(@post2.title)
    expect(page).to have_content(@post3.title)
  end


  it 'I can see the button that lets me view all the posts' do
    expect(page).to have_content('See all posts')
  end

  it "Redirect to user's post's show page when clicked" do
    click_link @post1.id
    expect(page).to have_current_path(user_post_path(@user1, @post1))
  end


  it 'Redirect  all posts page when clicked See all posts' do
    click_link 'See all posts'
    expect(page).to have_current_path(user_posts_path(@user1))
  end
end
