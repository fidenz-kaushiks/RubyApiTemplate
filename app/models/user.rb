class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  include DeviseTokenAuth::Concerns::User

  enum role: [:member, :trainer, :groom, :owner, :agent]

  has_many :horses

  validates :first_name, :last_name, :email, :role, :phone, :address, :city, :state, :zipcode, presence: true

  validates :phone, length: { minimum: 10 }, numericality: true

  def full_name
		"#{first_name} #{last_name}"
  end

  def full_address
    [self.address ,self.city, self.state, self.zipcode].reject { |e| e.blank? }.join(', ')
  end
end
