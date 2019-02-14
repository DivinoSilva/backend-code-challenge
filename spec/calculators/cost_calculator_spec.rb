require 'rails_helper'

describe CostCalculator do
  subject(:routes) {
    [
      create(:coordinated, origin: 'minha casa', destination: 'meu trabalho', distance: '50'),
      create(:coordinated, origin: 'minha casa', destination: 'minha piscina', distance: '2'),
      create(:coordinated, origin: 'minha piscina', destination: 'meu cinema', distance: '3'),
      create(:coordinated, origin: 'meu trabalho', destination: 'meu cinema', distance: '10'),
      create(:coordinated, origin: 'meu shopping', destination: 'meu restaurante', distance: '1')
    ]
  }

  subject(:valide_route) { CostCalculator.new(routes, 'minha casa', 'meu trabalho', 5) }
  subject(:invalide_route) { CostCalculator.new(routes, 'minha casa', 'meu restaurante', 5) }

  context 'when route exists' do
    it 'returns the correct shipping cost' do
      expect(valide_route.cost).to eq(11.25)
    end
  end

  context 'when route does not exists' do
    it 'route cost be infinity' do
      expect{ invalide_route.cost }.to raise_error(CostCalculator::CostError)
    end
  end
end
