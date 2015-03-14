require 'rails_helper'

RSpec.describe Api::GamesController, type: :controller do
  let(:valid_attributes) { FactoryGirl.attributes_for(:game) }
  let(:invalid_attributes) { Hash[team: ''] }
  let(:valid_params) { Hash[game: valid_attributes] }
  let(:invalid_params) { Hash[game: {teams: [invalid_attributes]}] }
  let(:parsed_body) { ActiveSupport::JSON.decode(response.body) }
  describe '#create' do
    context 'when valid params are passed' do
      it {expect{post :create,  valid_params}.to change(Game, :count).by(1)}
    end
    context 'when invalid params are passed' do
      it {expect{post :create,  invalid_params}.to change(Game, :count).by(0) }
    end
  end
end
