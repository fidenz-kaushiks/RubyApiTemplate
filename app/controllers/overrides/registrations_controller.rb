module Overrides
  class RegistrationsController < DeviseTokenAuth::RegistrationsController

    def create
      super
    end

    private

    def sign_up_params
      params.permit(:first_name, :last_name, :email, :password, :password_confirmation, :role, :phone, :address, :city, :state, :zipcode)
    end
  end
end