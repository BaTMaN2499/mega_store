class ApplicationController < ActionController::API
  # Public: This method simulates an authorization feature
  def current_user
    Customer.first
  end
end
