Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions:      'users/sessions'
  }

  root to: 'home#index'

  resources :users , only: [:account, :profile, :profile_edit, :profile_update]

  get 'users/account'
  get 'users/profile'
  get 'users/profile/edit' => 'users#profile_edit'
  patch 'users/profile/edit' => 'users#profile_update'

  resources :rooms

  get '/search', to: 'searches#search'

  resources :reservations do
    collection do
      post 'confirm'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
