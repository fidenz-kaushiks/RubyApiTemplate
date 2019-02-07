class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  include DeviseTokenAuth::Concerns::User

  enum role: [:member, :trainer, :groom, :owner, :agent]

  validates :first_name, :last_name, :email, :role, :phone, :address, :city, :state, :zipcode, presence: true

  validates :phone, length: { minimum: 10 }, numericality: true
end
