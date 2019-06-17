Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do


    devise_for :users
    root "fanfics#index", as: 'home'

    get 'about' => 'pages#about'

    # post 'chapter/create' =>
    resources :fanfics do
      resources :chapters do
        post 'create' => 'chapters#create'
      end
      resources :comments
    end
    resources :avatars, only: [:create, :destroy]
    resources :tags, only: [:show]
    resources :genres

  end
  # namespace :admin do
  #   resources :genres
  # end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
