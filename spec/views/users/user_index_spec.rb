require 'rails_helper'

RSpec.describe 'User index', type: :feature do
  before :each do
    @user1 = User.create(name: 'Ali', photo: 'https://picsum.photos/300/200', bio: 'Software Engineer from Pakistan',
                         posts_counter: 12)
    @user2 = User.create(name: 'Hassan', photo: 'https://picsum.photos/300/200', bio: 'Software Engineer from Morocco',
                         posts_counter: 2)
    visit users_path
  end

  it 'Show user name' do
    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
  end

  it 'I can see the profile picture for each user.' do
    expect(page).to have_css('img')
  end

  it 'Should see the number of posts the user has written' do
    expect(page).to have_content(@user1.posts_counter)
    expect(page).to have_content(@user2.posts_counter)
  end

  it 'should  redirect to user show page when clicked' do
    click_link(@user1.name)
    visit user_path(@user1)
    expect(current_path).to eql(user_path(@user1))
  end
end
