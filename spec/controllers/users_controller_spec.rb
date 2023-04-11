require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET #index' do
    before(:example) do
      @user = User.create(name: 'John Doe', photo: 'live to photo', bio: 'live to bio')
      get users_path
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns correct response status' do
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
      get user_path(@user)
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns correct response status' do
      expect(response).to be_successful
    end

    it 'renders the index template' do
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      expect(response.body).to include('content')
    end
  end
end
