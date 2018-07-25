class ApplicationController < ActionController::API
  #
  # This method simulates an authorization feature
  #
  def current_user
    Customer.first
  end
end
