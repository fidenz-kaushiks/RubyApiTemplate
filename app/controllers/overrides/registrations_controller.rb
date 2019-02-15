module Overrides
  class RegistrationsController < DeviseTokenAuth::RegistrationsController

    def create
      super do |user|
      	if user.persisted?
      	end
      end
    end

    private

    def sign_up_params
      params.permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone, :address, :city, :state, :zipcode, :subscription)
    end
  end
end