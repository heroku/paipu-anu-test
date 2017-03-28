require "rails_helper"

RSpec.describe "OAuth authentication", type: :request do
  def omniauth_url
    "http://www.example.com/"
  end

  it "allows users that are in the list" do
    # User from the list
    allowed_user_omniauth = github_omniauth_hash_for("ys")
    OmniAuth.config.mock_auth[:github] = allowed_user_omniauth

    # Calling back from GitHub's OAuth handshake
    get "/auth/github"
    expect(status).to eql(302)
    expect(headers["Location"]).to eql("#{omniauth_url}auth/github/callback")
    follow_redirect!

    # Following GitHub token storage, redirects to app root
    expect(status).to eql(302)
    expect(headers["Location"]).to eql(omniauth_url)
    follow_redirect!

    expect(status).to eql(200)
    expect(path).to eql(root_path)
    expect(session["user"]).to eql(allowed_user_omniauth["info"])
  end

  it "forbids users not in the list" do
    # User from the list
    OmniAuth.config.mock_auth[:github] =
      github_omniauth_hash_for("not-in-the-list")

    # Calling back from GitHub's OAuth handshake
    get "/auth/github"
    expect(status).to eql(302)
    expect(headers["Location"]).to eql("#{omniauth_url}auth/github/callback")
    follow_redirect!

    expect(status).to eql(403)
  end
end
