# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  include DeviseTokenAuth::Concerns::User

  enum user_role: %i[admin anonymous merchant player]

  def has_access?
    !user_role.nil? && user_role == :admin
  end
end
