class V1::StatesController < ApiController
	def index
    states = CS.states(:us)
    render json: {
      horses: CS.states(:us).keys
    }, status: :ok
  end
end
