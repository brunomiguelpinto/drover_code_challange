# spec/integration/pets_spec.rb
require 'swagger_helper'

describe 'Cars API' do
  path '/api/v1/cars' do
    post 'Creates a car' do
      tags 'Cars'
      consumes 'application/json'
      parameter name: :car, in: :body, schema: {
        type: :object,
        properties: {
          model_id: { type: :integer },
          maker_id: { type: :integer },
          subscription: { type: :integer },
          color: { type: :string },
          availability_date: { type: :string },
          year: { type: :integer }
        }
      }

      response '201', 'car created' do
       let(:maker) { create(:maker) }
        let(:model) { create(:model) }
        let(:subscription) { create(:subscription) }
        let(:car) { {
            car:{ maker_id: maker.id, year: 1999, model_id: model.id, color: 'lorem',
                  subscription_id: subscription.id, availability_date: DateTime.current }
        } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:car) { { car:{  name: 'foo' } } }
        run_test!
      end
    end
  end
end
