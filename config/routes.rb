Rails.application.routes.draw do

  resources :events

  namespace :api, defaults: { format: 'json' } do
    resources :events do
      collection do
        get :list_events
      end
    end
  end

  root "events#index"
end
