Rails.application.routes.draw do
  # get 'supplies/index'
  # get 'supplies/show'
  # get 'supplies/new'
  # get 'supplies/edit' 
  get 'supplies/requsted' , to: 'supplies#hospitalAreNeeded' , as: 'hospital_in_need'

  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
    
      resources :hospitals, :supplies
  get 'pages/home'
  get 'hospitals/:id/supplies', to: 'supplies#findById', as: 'usersupplies'
  
  root to: "pages#home"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
