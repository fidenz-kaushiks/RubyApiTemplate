class V1::StatesController < ApiController
	def index
    keys = CS.states(:us).keys
    i = 0
    states = keys.collect { |item|
    	{id: keys.index(item), item: item}
    }
    render json: {
      data: states
    }, status: :ok
  end
end
