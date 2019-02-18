class V1::TiersController < ApiController
  def index
    tiers  = Tier.all
    render json: {
      tiers: tiers
    }.to_json,
    status: (tiers.blank? ? :no_content : :ok)
  end
end
