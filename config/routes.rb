Rails.application.routes.draw do
  get "/auth/github/callback", to: "sessions#github"

  root to: "root#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
