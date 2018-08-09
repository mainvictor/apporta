require 'rails_helper'

RSpec.describe 'Challenges API', type: :request do
  # initialize test data 
  let!(:challenges) { create_list(:challenge, 10) }
  let(:challenge_id) { challenges.first.id }

  # Test suite for GET /todos
  describe 'GET /challenges' do
    # make HTTP get request before each example
    before { get '/challenges' }

    it 'returns chanllenges' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /todos/:id
  describe 'GET /challenges/:id' do
    before { get "/challenges/#{challenge_id}" }

    context 'when the record exists' do
      it 'returns the challenge' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(challenge_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:challenge_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Challenge/)
      end
    end
  end

  # Test suite for POST /todos
  describe 'POST /challenges' do
    # valid payload
    let(:valid_attributes) { { title: 'Learn Elm', description: 'Random desc',
         media: 'http://example.com/imagen.jpg' } }

    context 'when the request is valid' do
      before { post '/challenges', params: valid_attributes }

      it 'creates a challenge' do
        expect(json['title']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/challenges', params: { description: 'Random desc',
       } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Title can't be blank/)
      end
    end
  end

  # Test suite for PUT /todos/:id
  describe 'PUT /challenges/:id' do
    let(:valid_attributes) { { title: 'Shopping' } }

    context 'when the record exists' do
      before { put "/challenges/#{challenge_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /todos/:id
  describe 'DELETE /challenges/:id' do
    before { delete "/challenges/#{challenge_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end