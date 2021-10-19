Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   # root 'application#hello'
   root 'pages#home'
   get 'about', to: 'pages#about'
   resources :articles #, only: [:index, :show, :new, :create, :edit, :update]
   get 'signup', to: 'users#new'
   resources :users, except: [:new]
   #post 'users', to: 'users#create'
   get 'login', to: 'sessions#new'
   post 'login', to: 'sessions#create'
   delete 'logout', to: 'sessions#destroy'
end
