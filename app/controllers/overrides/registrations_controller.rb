module Overrides
  class RegistrationsController < DeviseTokenAuth::RegistrationsController

    def create
      super do |user|
      	if user.persisted?
      	end
      end
    end

    def update
      byebug
      super do |user|
        byebug
        sign_out(user) if user.is_password_changed?
      end
    end

    private

    def sign_up_params
      params.permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone, :address, :city, :state, :zipcode, :subscription)
    end

    def account_update_params
      params.permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone, :address, :city, :state, :zipcode)
    end
  end
end