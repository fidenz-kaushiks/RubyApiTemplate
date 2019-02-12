class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User

  attribute :subscription

  enum role: [:member, :trainer, :groom, :owner, :agent]
  enum status: [:inactive, :active]

  has_many :horses
  has_one :user_tier

  validates :first_name, :last_name, :email, :role, :phone, :address, :city, :state, :zipcode, :status, presence: true

  validates :phone, length: { minimum: 10 }, numericality: true

  after_commit :add_tier, on: :create

  def full_name
		"#{first_name} #{last_name}"
  end

  def full_address
    [self.address ,self.city, self.state, self.zipcode].reject { |e| e.blank? }.join(', ')
  end

  def has_tier?
    self.user_tier.nil? ? false : true
  end

  def is_active?
    User.statuses[self.status] == User.statuses[:active] ? true : false
  end

  def horse_count
    self.horses.count
  end

  def tier_horse_count
    self.user_tier.horses
  end

  private

  def add_tier
    user_tier = UserTier.new
    user_tier.user = self
    user_tier.tier = subscription_tier
    user_tier.save!
  end

  def subscription_tier
    Tier.find_by(id: subscription.to_i)
  end
end
