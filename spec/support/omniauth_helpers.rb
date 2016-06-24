module OmniauthHelpers
  def github_omniauth_hash_for(nickname)
    user_info = {
      name: "Jon Doe",
      nickname: nickname,
      avatar_url: "https://avatars.githubusercontent.com/u/7574917?v=3"
    }

    credentials = {
      token: SecureRandom.hex(24)
    }

    OmniAuth::AuthHash.new(provider: "github",
                           uid: "7574917",
                           info: user_info,
                           credentials: credentials)
  end
end
