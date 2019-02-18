# frozen_string_literal: true

class ApiController < ActionController::API
  # inherit_resources
  include DeviseTokenAuth::Concerns::SetUserByToken

  def error_tag(resource)
  	errors = resource.errors.messages
  	all    = { full_messages: resource.errors.full_messages }
  	return errors.merge!(all)
  end
end
