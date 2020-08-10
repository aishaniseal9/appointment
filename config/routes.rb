Rails.application.routes.draw do
  resources :search_suggestions
  devise_for :users,:controllers => {registrations: 'registrations'}
  get 'register_users/index'
  get 'tests/list'
  get 'hospitals/list'
  get 'users/index'
  get 'welcome/index' 
     resources :register_users
    #resources :users do
       #resources:hospitals
       #resources:tests
    #end
    resources :tests
    resources :hospitals
    resources :hospital_tests
    resources :bookings
    resources :users do
       resources :bookings,controller: 'users/bookings'
    end
    resources :searches
 root 'welcome#index'
end
