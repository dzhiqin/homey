Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'about_us',to: "welcome#about_us"
  namespace :admin do
    resources :houses
  end
  resources :houses
end
