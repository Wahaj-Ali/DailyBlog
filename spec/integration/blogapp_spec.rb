require 'swagger_helper'

RSpec.describe 'api/blogs', type: :request do
  path '/posts' do
    post 'Retrieves a list of all posts for a user' do
      tags 'Posts'
      produces 'application/json'

      response '200', 'OK' do
        schema type: :array,
        items: {
          type: :object,
          properties: {
            id: { type: :integer },
            title: { type: :string },
            text: { type: :string },
            author: {
              type: :object,
              properties: {
                id: { type: :integer },
                name: { type: :string },
                photo: { type: :string, nullable: true },
                bio: { type: :string, nullable: true }
              },
              required: ['id', 'name']
            },
            comments: {
              type: :array,
              items: {
                type: :object,
                properties: {
                  id: { type: :integer },
                  text: { type: :string },
                  author_id: { type: :integer },
                  post_id: { type: :integer }
                },
                required: ['id', 'text', 'author_id', 'post_id']
              }
            }
          },
          required: ['id', 'title', 'text', 'author', 'comments']
        }

        run_test!
      end
    end
  end

  path '/posts/{post_id}/comments' do
    get 'Retrieves comments for a post' do
      tags 'Comments'
      produces 'application/json'
      parameter name: :post_id, in: :path, type: :integer

      response '200', 'Comments retrieved' do
        let(:post_id) { 11 }
        let!(:comment1) { Comment.create(author_id: 1, post_id: post_id, text: 'comment') }
        let!(:comment2) { Comment.create(author_id: 3, post_id: post_id, text: 'New comment') }
        run_test!
      end

      response '404', 'Post not found' do
        let(:post_id) { 999 }
        run_test!
      end
    end
  end

  path '/comments' do
    post 'Creates a new comment' do
      tags 'Comments'
      consumes 'application/json'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          author_id: { type: :integer },
          post_id: { type: :integer },
          text: { type: :string }
        },
        required: ['author_id', 'post_id', 'text']
      }

      response '201', 'comment created' do
        let(:comment) { { author_id: 1, post_id: 11, text: 'comment' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:comment) { { author_id: 1, post_id: 11 } }
        run_test!
      end
    end
  end

  path '/comments' do
    post 'Creates a new comment' do
      tags 'Comments'
      consumes 'application/json'

      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          author_id: { type: :integer },
          post_id: { type: :integer },
          text: { type: :string }
        },
        required: ['author_id', 'post_id', 'text']
      }

      response '201', 'Created' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            author_id: { type: :integer },
            post_id: { type: :integer },
            text: { type: :string }
          },
          required: ['id', 'author_id', 'post_id', 'text']

        let(:comment) do
          {
            author_id: 1,
            post_id: 11,
            text: 'This is a new comment'
          }
        end

        run_test!
      end

      response '400', 'Bad Request' do
        schema type: :object,
          properties: {
            error: { type: :string }
          },
          required: ['error']

        let(:comment) { { author_id: 1, post_id: 11 } } # missing required 'text' attribute

        run_test!
      end
    end
  end
end