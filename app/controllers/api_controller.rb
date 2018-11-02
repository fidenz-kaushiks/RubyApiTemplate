class ApiController < ActionController::API
  inherit_resources
  include DeviseTokenAuth::Concerns::SetUserByToken
end
