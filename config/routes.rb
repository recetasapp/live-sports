Rails.application.routes.draw do

  root "site#welcome"
  
  resources :sports, only: [:index, :show] do
    resources :events, only: [:show]
  end

end
