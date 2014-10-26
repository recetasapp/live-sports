Rails.application.routes.draw do

  scope "(:locale)", locale: /en|es/ do
    root "site#welcome"
  
    resources :sports, only: [:index, :show] do
      resources :events, only: [:show]
    end
  end


end
