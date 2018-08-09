require 'rails_helper'

RSpec.describe 'ChallengeDonations API' do
  # Initialize the test data
  let!(:challenge) { create(:challenge) }
  let!(:challenge_donations) { create_list(:challenge_donation, 20, challenge_id: challenge.id) }
  let(:challenge_id) { challenge.id }
  let(:id) { challenge_donations.first.id }

  # Test suite for GET /challenges/:challenge_id/challenge_donations
  describe 'GET /challenges/:challenge_id/challenge_donations' do
    before { get "/challenges/#{challenge_id}/challenge_donations" }

    context 'when todo exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all todo challenge_donations' do
        expect(json.size).to eq(20)
      end
    end

    context 'when todo does not exist' do
      let(:challenge_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Challenge/)
      end
    end
  end

  # Test suite for GET /challenges/:challenge_id/challenge_donations/:id
  describe 'GET /challenges/:challenge_id/challenge_donations/:id' do
    before { get "/challenges/#{challenge_id}/challenge_donations/#{id}" }

    context 'when todo item exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the item' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when todo item does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find ChallengeDonation/)
      end
    end
  end

  # Test suite for PUT /challenges/:challenge_id/challenge_donations
  describe 'POST /challenges/:challenge_id/challenge_donations' do
    let(:valid_attributes) { { media: 'http://miserver.com/myimage.jpg', city: 'Bogota', 
        description: 'My ramdon desc', lat: 10.1222, lng: 4.9087 } }

    context 'when request attributes are valid' do
      before { post "/challenges/#{challenge_id}/challenge_donations", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/challenges/#{challenge_id}/challenge_donations", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Media can't be blank/)
      end
    end
  end

  # Test suite for PUT /challenges/:challenge_id/challenge_donations/:id
  describe 'PUT /challenges/:challenge_id/challenge_donations/:id' do
    let(:valid_attributes) { { media: 'http://miserver.com/myimage.jpg' } }

    before { put "/challenges/#{challenge_id}/challenge_donations/#{id}", params: valid_attributes }

    context 'when item exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the item' do
        updated_item = ChallengeDonation.find(id)
        expect(updated_item.media).to match("http://miserver.com/myimage.jpg")
      end
    end

    context 'when the item does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find ChallengeDonation/)
      end
    end
  end

  # Test suite for DELETE /challenges/:id
  describe 'DELETE /challenges/:id' do
    before { delete "/challenges/#{challenge_id}/challenge_donations/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end