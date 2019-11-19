class CostsController < ActionController::API
  class CostError < StandardError; end

  def index
    coordinateds = Coordinated.all

    simualted_cost = CostCalculator.new(coordinateds, params['origin'].downcase, params['destination'].downcase, weight).cost

    render json: { message: simualted_cost }, status: :ok
  rescue => e
    render json: { message: e.message }, status: :unprocessable_entity
  end

  private

  def weight
    w = params['weight'].to_f

    raise CostError.new('invalid_weight') if w <= 0 || w > 50

    w
  end
end
