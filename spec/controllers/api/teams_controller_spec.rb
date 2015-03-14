require 'rails_helper'

RSpec.describe Api::TeamsController, type: :controller do
  let(:valid_attributes) { FactoryGirl.attributes_for(:team) }
  let(:invalid_attributes) { Hash[players: {'1': ''}] }
  let(:valid_params) { Hash[team: valid_attributes] }
  let(:invalid_params) { Hash[team: invalid_attributes] }
  let(:parsed_body) { ActiveSupport::JSON.decode(response.body) }
  describe '#create' do
    context 'when valid params are passed' do
      it {expect{post :create,  valid_params}.to change(Team, :count).by(1)}
    end
    context 'when invalid params are passed' do
      it {expect{post :create,  invalid_params}.to change(Team, :count).by(0) }
    end
  end
end
