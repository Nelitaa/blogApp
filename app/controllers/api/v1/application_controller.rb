class Api::V1::ApplicationController < ActionController::API
  before_action :set_default_format
  protect_from_forgery with: :exception

  private

  def set_default_format
    request.format = :json
  end
end
