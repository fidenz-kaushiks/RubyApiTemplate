class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  include DeviseTokenAuth::Concerns::User

  belongs_to :user_role

  def has_access?
    !user_role.nil? and user_role.slug.downcase == 'admin'.downcase
  end
end
