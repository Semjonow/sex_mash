SexMash::Application.routes.draw do

  scope ':reciever_id' do
    resources :messages, only: [:new, :create]
  end

  scope 'users' do
    match ''       => 'users/settings#edit',   as: :edit_user
    match 'update' => 'users/settings#update', as: :user_path, via: :put
    match ':id'    => 'main#show', as: :user
  end

  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'login',  to: 'users/sessions#new',     as: :new_user_session
    get 'logout', to: 'users/sessions#destroy', as: :destroy_user_session
  end

  root to: 'main#index'
end
