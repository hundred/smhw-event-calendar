Rails.application.routes.draw do

  resources :events

  namespace :api, defaults: { format: 'json' } do
    resources :events, only: [:create, :update] do
      collection do
        get :list_events
      end
    end
  end

  root "events#index"
end
