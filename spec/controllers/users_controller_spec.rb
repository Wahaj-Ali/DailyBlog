require 'rails_helper'

RSpec.describe '/users', type: :request do
  # let!(:user) { User.create(name: 'Wahaj', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Student.') }
  # let!(:post) { Post.create(author: user, Title: 'My First Post', Text: 'Lorem ipsum') }
  describe 'GET #index' do
    it 'returns http success' do
      get users_path
      expect(response).to have_http_status(:success)
    end

    it 'returns correct response status' do
      get users_url
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get users_url
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get users_url
      expect(response.body).to include('Here are all the users:')
    end
  end
end
