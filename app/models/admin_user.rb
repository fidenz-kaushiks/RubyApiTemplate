class AdminUser < ApplicationRecord
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def is_admin?
  	true
  end
end
