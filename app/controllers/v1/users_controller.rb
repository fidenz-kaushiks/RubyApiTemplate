class V1::UsersController < ApiController
	def step1
		user = User.new(sign_up_params)
		if user.valid?
			render json: {
        status: 'success',
        data: user,
      }, status: :ok
    else
    	render json: {
	      status: 'error',
	      data: user,
	      errors: error_tag(user),
	    }, status: :unprocessable_entity
		end
	end

	private

	def sign_up_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone, :address, :city, :state, :zipcode)
  end
end
