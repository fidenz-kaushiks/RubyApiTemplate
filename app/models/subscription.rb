class Subscription < ApplicationRecord
	belongs_to :user_tier
	enum status: [:pending, :active, :deactive, :error, :cancel]
end
