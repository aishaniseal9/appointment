Rails.application.routes.draw do
  get 'register_users/index'
  get 'tests/list'
  get 'hospitals/list'
  get 'users/index'
  get 'welcome/index' 
     resources :register_users
    resources :users do
       resources:hospitals
       resources:tests
    end
    resources :tests
    resources :hospitals
  
 root 'welcome#index'
end
