require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET #index' do
    before(:example) do
      @user = User.create(name: 'John Doe', photo: 'live to photo', bio: 'live to bio')
      @post = Post.create(title: 'title', text: 'content', author: @user)
      get user_posts_path(@user)
    end
    it 'renders a successful response' do
      expect(response).to be_successful
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('John Doe')
    end
  end

  describe 'GET #show' do
    before(:example) do
      @user = User.create(name: 'John Doe', photo: 'live to photo', bio: 'live to bio')
      @post = Post.create(title: 'title', text: 'content', author: @user)
      get user_post_path(@user, @post)
    end
    it 'renders a successful response' do
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text' do
      expect(response.body).to include('content')
    end
  end
end
