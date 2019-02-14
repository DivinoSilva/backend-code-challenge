require 'rails_helper'

describe CoordinatedsController do
  describe 'POST #create' do
    context 'when coordinateds does not exists' do
      it 'creates coordinateds' do
        post :create, params: { origin: "Minha casa", destination: "Meu trabalho", distance: "12345" }

        coordinated = Coordinated.last

        expect(response.status).to eq(200)
        expect(coordinated.origin ).to eq('minha casa')
        expect(coordinated.destination ).to eq('meu trabalho')
        expect(coordinated.distance ).to eq(12345)
      end
    end

    context 'when coordinateds exists' do
      let!(:coordinated) { create(:coordinated, distance: 150) }
      it 'creates coordinateds' do
        post :create, params: { origin: "minha casa", destination: "meu trabalho", distance: "7" }

        expect(response.status).to eq(200)
        expect(coordinated.reload.distance ).to eq(7)
      end
    end

    context 'error' do
      context 'when distance is invalid' do
        it 'return invalid distance message' do
          post :create, params: { origin: "minha casa", destination: "meu trabalho", distance: "-1" }

          expect(response.status).to eq(422)
          expect(JSON.parse(response.body)['message']).to eq('Coordinated::InvalidDistance')
        end
      end
    end
  end
end
