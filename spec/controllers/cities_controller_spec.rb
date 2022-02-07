require 'rails_helper'

class CitiesControllerTest < ActionDispatch::IntegrationTest
  RSpec.describe CitiesController, type: :controller do
    describe 'GET index' do
      it 'has a 200 status code' do
        city = ['Porto Alegre', 'Caxias', 'Gramado', 'Florianopolis', 'Joinville', 'Blumenau', 'Curitiba', 'Maringa', 'Cascavel']
        get :index, params: { query: city.sample }
        expect(city).to match_array(['Porto Alegre', 'Caxias', 'Gramado', 'Florianopolis', 'Joinville', 'Blumenau', 'Curitiba', 'Maringa', 'Cascavel'])
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
