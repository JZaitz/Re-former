Rails.application.routes.draw do
   resources :users do #only: [:new, :create, :edit, :show, :update, :index]
    resources :events
   end
   
    
    
    #get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
