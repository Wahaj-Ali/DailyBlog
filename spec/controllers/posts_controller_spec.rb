require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET #index' do
    it 'renders a successful response' do
      get user_posts_path(2)
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get user_posts_path(5)
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get user_posts_path(1)
      expect(response.body).to include('<h1>Here are the posts for user:</h1>')
    end
  end

  describe 'GET #show' do
    it 'renders a successful response' do
      get user_post_url(1, 3)
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get user_post_url(1, 3)
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text' do
      get user_post_url(1, 3)
      expect(response.body).to include('<h1>Here are the details for post:</h1>')
    end
  end
end
