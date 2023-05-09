require 'rails_helper'

RSpec.describe 'Addresses API', type: :request do
  let!(:person) { create(:person) }
  let!(:addresses) { create_list(:address, 10, person_id: person.id) }
  let(:address_id) { addresses.first.id }
  let(:response_body) { JSON.parse(response.body) }

  describe 'GET /addresses' do
    before { get '/addresses' }

    it 'returns addresses' do
      expect(response_body).not_to be_empty
      expect(response_body.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /addresses/:id' do
    before { get "/addresses/#{address_id}" }

    context 'when the record exists' do
      it 'returns the address' do
        expect(response_body).not_to be_empty
        expect(response_body['id']).to eq(address_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'POST /addresses' do
    let(:valid_attributes) { { address: { street: 'Av. Paulista', city: 'São Paulo', state: 'SP', postal_code: '01310-100', country: 'Brasil', person_id: person.id } } }

    context 'when the request is valid' do
      before { post '/addresses', params: valid_attributes }

      it 'creates an address' do
        expect(response_body['street']).to eq('Av. Paulista')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'PUT /addresses/:id' do
    let(:valid_attributes) { { address: { street: 'Av. Brigadeiro Faria Lima' } } }

    context 'when the record exists' do
      before { put "/addresses/#{address_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response_body['street']).to eq('Av. Brigadeiro Faria Lima')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'DELETE /addresses/:id' do
    before { delete "/addresses/#{address_id}" }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
