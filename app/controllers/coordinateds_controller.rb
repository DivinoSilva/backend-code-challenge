class CoordinatedsController < ActionController::API
  def create
    coordinateds = Coordinated.where("coordinateds.origin ilike ? and
                                      coordinateds.destination ilike ?",
                                      params['origin'], params['destination'])
                              .first

    if coordinateds.present?
      coordinateds.update(distance: params['distance'].to_i)
    else
      Coordinated.create(coordinateds_attributes)
    end
    head :ok
  rescue => e
      render json: { message: e.message }, status: :unprocessable_entity
  end

  private

  def coordinateds_attributes
    {
      origin: params['origin'],
      destination: params['destination'],
      distance: params['distance'].to_i
    }
  end
end
