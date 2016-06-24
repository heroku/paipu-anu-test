# Base application controller
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate!, except: [:health, :boomtown]

  def health
    render json: { status: "OK" }, status: :ok
  end

  def boomtown
    raise("Intentional exception from the web app")
  end

  private

  def authenticate!
    redirect_to "/auth/github" unless session["user"]
  end
end
