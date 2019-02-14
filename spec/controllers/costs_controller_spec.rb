require 'rails_helper'

describe CostsController do
  describe '#index' do
    before do
      create(:coordinated, origin: 'minha casa', destination: 'meu trabalho', distance: '1' )
      create(:coordinated, origin: 'meu trabalho', destination: 'meu lazer', distance: '1' )
      create(:coordinated, origin: 'meu cinema', destination: 'minha piscina', distance: '1' )
    end

    context 'and weight is invalid' do
      it 'return invalid_weight message' do
        get :index, params: { origin: 'Minha casa', destination: 'Meu lazer', weight: '-1' }

        expect(response.status).to eq(422)
        expect(JSON.parse(response.body)['message']).to eq('invalid_weight')
      end
    end

    context 'and weight is valid' do
      context 'an route does not exists' do
        it 'return route_not_found message' do
          get :index, params: { origin: 'minha casa', destination: 'meu cinema', weight: '1' }

          expect(response.status).to eq(422)

          expect(JSON.parse(response.body)['message']).to eq('route_not_found')
        end
      end

      context 'an route exists' do
        it 'return shipping cost' do
          get :index, params: { origin: 'minha casa', destination: 'meu lazer', weight: '1' }

          expect(response.status).to eq(200)
          expect(JSON.parse(response.body)['message']).to eq(0.3)
        end
      end
    end
  end
end
