Rails.application.routes.draw do
  # devise_scope :user do
  #   root to: "users/sessions#new" 
  # end

  delete 'supplies/:id' , to:'supplies#destroy', as:'delete'
  get 'supplies/requsted' , to: 'supplies#hospitalAreNeeded' , as: 'hospital_in_need'
  get 'supplies/search' , to:'supplies#search' , as: 'search'

  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
    
      resources :hospitals, :supplies 
  get 'pages/home'
  get 'hospitals/:id/supplies', to: 'supplies#findById', as: 'usersupplies'
  

root "pages#home"


  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
