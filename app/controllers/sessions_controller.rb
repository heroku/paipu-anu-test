# OAuth Callback controller
class SessionsController < ApplicationController
  skip_before_action :authenticate!
  before_action :check_username!

  def github
    session["user"] = omniauth_info
    redirect_to request.env["omniauth.origin"] || "/"
  end

  def check_username!
    head :forbidden unless allowed?(omniauth_email)
  end

  def allowed?(username)
    allowed_usernames.include?(username)
  end

  def allowed_usernames
    ENV["ALLOWED_GITHUB_USERNAMES"].split(",")
  end

  def omniauth_email
    omniauth_info["nickname"]
  end

  def omniauth_info
    omniauth_auth["info"].to_h
  end

  def omniauth_auth
    request.env["omniauth.auth"]
  end
end
