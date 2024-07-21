# Rails.application.routes.draw do
 # devise_for :user123
#   devise_for :users
#   root  to: 'tweets#index'
#   resources :tweets, only: [:index, :new, :create,:destroy,:edit,:update,:show] do
#     resources :comments, only: :create
#     collection do
#       get 'search'
#     end
#   resources :users, only: :show
  
#   # root to: 'tweets#index'
#   # resources :tweets do
#   #   resources :comments, only: :create
#   # end
#   # resources :users, only: :show
# end
Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    passwords: 'users/passwords1' # Sử dụng controller Users::PasswordsController
  }

  root to: 'tweets#index'

  resources :tweets, only: [:index, :new, :create, :destroy, :edit, :update, :show] do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end

  resources :users, only: :show
end
