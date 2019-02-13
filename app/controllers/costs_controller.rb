class CostsController < ActionController::API
  class CostError < StandardError; end

  def index
    cost_simualted = CostCalculator.new(origin, destination, weight).cost

    render json: { message: cost_simualted }, status: :ok
  rescue => e
      render json: { message: e.message }, status: :unprocessable_entity
  end

  private

  def origin
    o = Coordinated.find_by(origin: params['origin'])

    raise CostError.new('not_found')unless o.present?
  end

  def destination
    d = Coordinated.find_by(destination: params['destination'])

    raise CostError.new('not_found') unless d.present?
  end

  def weight
    w = params['weight'].to_f

    raise CostError.new('invalid_weight') if w <= 0 || w > 50

    w
  end
end
