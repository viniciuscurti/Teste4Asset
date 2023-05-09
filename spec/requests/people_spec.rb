require 'rails_helper'

RSpec.describe 'People API', type: :request do
  let!(:people) { create_list(:person, 10) }
  let(:person_id) { people.first.id }
  let(:response_body) { JSON.parse(response.body) }

  describe 'GET /people' do
    before { get '/people' }

    it 'returns people' do
      expect(response_body).not_to be_empty
      expect(response_body.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /people/:id' do
    before { get "/people/#{person_id}" }

    context 'when the record exists' do
      it 'returns the person' do
        expect(response_body).not_to be_empty
        expect(response_body['id']).to eq(person_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:person_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response_body).to have_http_status(:not_found)
      end
    end
  end

  describe 'POST /people/create' do
    let(:valid_attributes) { { person: { name: 'John Doe', birthdate: '1990-01-01', email: 'johndoe@test.com', phone: '(11) 99999-9999' } } }

    context 'when the request is valid' do
      before { post '/people', params: valid_attributes }

      it 'creates a person' do
        expect(response_body['name']).to eq('John Doe')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before { post '/people', params: { person: { name: 'John Doe' } } }

      it 'returns status code 422' do
        expect(response.body.to_s).to match("{\"email\":[\"can't be blank\"],\"phone\":[\"can't be blank\"],\"birthdate\":[\"can't be blank\"]}")
      end
    end
  end

  describe 'PUT /people/:id' do
    let(:valid_attributes) { { person: { name: 'Jane Doe' } } }

    context 'when the record exists' do
      before { put "/people/#{person_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response_body['name']).to eq('Jane Doe')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'DELETE /people/:id' do
    before { delete "/people/#{person_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(200)
    end
  end
end
