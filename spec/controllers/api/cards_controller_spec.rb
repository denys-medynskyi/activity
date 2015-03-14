require 'rails_helper'

RSpec.describe Api::CardsController, type: :controller do
  let(:valid_attributes) { FactoryGirl.attributes_for(:card) }
  let(:invalid_attributes) { Hash[word: '', difficulty: ''] }
  let(:valid_params) { Hash[card: valid_attributes] }
  let(:invalid_params) { Hash[card: invalid_attributes] }
  let(:parsed_body) { ActiveSupport::JSON.decode(response.body) }
  let(:card){ FactoryGirl.create(:card) }

  describe '#create' do
    context 'when valid params are passed' do
      it {expect{post :create,  valid_params}.to change(Card, :count).by(1) }
    end
    context 'when invalid params are passed' do
      it {expect{post :create,  invalid_params}.to change(Card, :count).by(0) }
      it 'renders error' do
        post :create,  invalid_params
        expect(parsed_body['error']).not_to be_nil
      end
    end
  end

  describe '#update' do
    context 'when valid params are passed' do
      it 'updates card' do
        expect(card.word).not_to eq(valid_attributes[:word])
        put :update, id: card, card: valid_attributes
        expect(Card.find(card.id).word).to eq(valid_attributes[:word])
      end
    end
    context 'when invalid params are passed' do
      it 'updates card' do
        put :update, id: card, card: invalid_attributes
        expect(parsed_body['error']).not_to be_nil
      end
    end
  end

  describe '#destroy' do
    it 'destroys count' do
      delete :destroy, id: card
      expect(Card.count).to eq(0)
    end
  end
end
