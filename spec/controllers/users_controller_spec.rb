require 'rails_helper'

RSpec.describe UsersController, type: :request do
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

  describe 'GET #show' do
    it 'returns http success' do
      get users_url(1)
      expect(response).to have_http_status(:success)
    end

    it 'returns correct response status' do
      get users_url(1)
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get user_url(1)
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      get user_url(2)
      expect(response.body).to include('<h1>Here are the details for user:</h1>')
    end
  end
end
