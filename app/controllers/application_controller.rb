# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions
  protect_from_forgery

  def access_denied(exception)
    redirect_to admin_dashboard_path, alert: exception.message
  end
end
