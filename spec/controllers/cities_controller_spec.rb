require 'rails_helper'

class CitiesControllerTest < ActionDispatch::IntegrationTest
  RSpec.describe CitiesController, type: :controller do
    describe 'GET index' do
      it 'renders the index template' do
        get :index
        expect().to route_to cities_path
      end

      it 'renders the answer correct' do
        get :index
        expect(response).to eq format: :json
      end
    end

    describe 'responds to' do
      it 'responds to custom formats when provided in the params' do
        get :index, params: { query: 'Maringa', format: :json }
        expect(response.content_type).to eq 'application/json; charset=utf-8'
      end
    end
  end
end
