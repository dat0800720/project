Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "static_pages#home"
  scope "(:locale)", locale: /en|vi/ do
    get "/home", to:"static_pages#home"
    resources :users do
      collection do
        patch :ajax_update
      end
    end
    resources :members
    resources :holidays
    resources :rooms
    resources :calendars
    resources :requests do
      member do
        put "approved", to: "requests#approved"
      end
    end
  end
end
