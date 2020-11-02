# spec/integration/pets_spec.rb
require 'swagger_helper'

describe 'Cars API' do
  path '/api/v1/cars' do
    post 'Creates a car' do
      tags 'Cars'
      consumes 'application/json', 'application/xml'
      parameter name: :pet, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          photo_url: { type: :string },
          status: { type: :string }
        },
        required: %w[name status]
      }

      response '201', 'car created' do
        let(:pet) { { name: 'Dodo', status: 'available' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:pet) { { name: 'foo' } }
        run_test!
      end
    end
  end

  path '/api/v1/cars' do
    get 'Retrieves a list of cars' do
      tags 'Cars'
      produces 'application/json', 'application/xml'
      parameter name: :page, in: :path, type: :string,
                required: false,
                description: 'Creates a flexible blog from provided data'
      parameter name: :maker, in: :path, type: :string
      parameter name: :model, in: :path, type: :string
      parameter name: :color, in: :path, type: :string
      parameter name: :sort_by, in: :path, type: :string
      parameter name: :sort_order, in: :path, type: :string

      response '200', 'name found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 photo_url: { type: :string },
                 status: { type: :string }
               },
               required: %w[id name status]

        let(:id) { Pet.create(name: 'foo', status: 'bar', photo_url: 'http://example.com/avatar.jpg').id }
        run_test!
      end
    end
  end

  path '/api/v1/cars/{id}' do
    get 'Retrieves a car' do
      tags 'Cars'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'name found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 photo_url: { type: :string },
                 status: { type: :string }
               },
               required: %w[id name status]

        let(:id) { Pet.create(name: 'foo', status: 'bar', photo_url: 'http://example.com/avatar.jpg').id }
        run_test!
      end

      response '404', 'pet not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end