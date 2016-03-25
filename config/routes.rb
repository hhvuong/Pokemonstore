Rails.application.routes.draw do
  root :to =>"home#page1"


  get 'home/page1'
  get 'home/thanks'

  get 'home/feedback'
  #get 'info/page1'

  #get 'logins/new_login'

  #get 'logins/show_logins'

  #get 'logins/login_form'

  #get 'logins/registration_confirmation'

  resources :shopping_carts
  
  resources :customers do
     member do
       post :add_product 
     end
  end

  resources :orders
  resources :products
  
  #Rails.application.routes.draw do
  get  'logins/new_login' #the page to make a new login
  get 'logins/registration_confirmation'
  post 'logins/registration_confirmation'
  get 'logins/login_form' # the login page 
  post 'logins/login_form'
  get  'logins/show_logins'
  post 'logins/show_logins'
  get 'logins/logout'
  post 'logins/logout'
  get 'info/page1'
  
end
