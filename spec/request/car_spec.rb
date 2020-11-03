require 'rails_helper'

RSpec.describe 'Cars API', type: :request do
  # initialize test data
  let!(:cars) { create_list(:car, 50) }
  let(:car_id) { cars.first.id }

  # Test suite for GET /cars
  describe 'GET /cars' do
    # make HTTP get request before each example
    before { get '/api/v1/cars' }

    it 'returns cars' do
      expect(response.body).not_to be_empty
      expect(JSON.parse(response.body).size).to eq(20)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /articles/:id
  describe 'GET /cars/:id' do
    before { get "/api/v1/cars/#{car_id}" }

    context 'when the record exists' do
      it 'returns the car' do
        expect(response.body).not_to be_empty
        expect(JSON.parse(response.body)['id']).to eq(car_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:car_id) { 999 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  # Test suite for POST /cars
  describe 'POST /cars' do
    # valid payload

    let(:maker) { create(:maker) }
    let(:model) { create(:model) }
    let(:subscription) { create(:subscription) }
    let(:valid_attributes) { {
        car:{ maker_id: maker.id, year: 1999, model_id: model.id, color: 'lorem',
              subscription_id: subscription.id, availability_date: DateTime.current }
    } }

    context 'when the request is valid' do
      before { post '/api/v1/cars', params: valid_attributes }

      it 'creates a car' do
        expect(JSON.parse(response.body)['color']).to eq('lorem')
        expect(JSON.parse(response.body)['year']).to eq(1999)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end

  # Test suite for PUT /cars/:id
  describe 'PUT /cars/:id' do
    let(:valid_attributes) { { car: {color: 'pink'} } }

    context 'when the record exists' do
      before { put "/api/v1/cars/#{car_id}", params: valid_attributes }

      it 'returns status code 204' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # Test suite for DELETE /cars/:id
  describe 'DELETE /cars/:id' do
    before { delete "/api/v1/cars/#{car_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end


end
