Rails.application.routes.draw do
  get 'users/account'
  get 'users/profile'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions:      'users/sessions'
  }
  get 'home/index'
  root to: 'home#index'
  resources :users , only: [:account, :profile, :profile_edit, :profile_update]
  get 'users/account' => 'users#account'
  get 'users/profile' => 'users#profile'
  get 'users/profile/edit' => 'users#profile_edit'
  patch 'users/profile/edit' => 'users#profile_update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
