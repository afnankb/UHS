Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
      resources :hospitals
  get 'pages/home'
  # get 'hospitals/:id', to: 'hospitals#show', as: 'hospitals'
  
  root to: "pages#home"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
