Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :employees
  resources :expenses

  root "main#index"

  get "/main" , to: "main#index"

  get "/about" , to: "about#index"

  get "sign_up", to: "employees#new"
  post "/sign_up", to: "employees#create"

  get "sign_in", to: "sessions#new"
  post "/sign_in", to: "sessions#create"

  # get "password", to: "sessions#new"
  # patch "/sign_in", to: "sessions#create"

  get "/expenses/new", to:"expenses#new"
  post "/expenses/new", to:"expenses#new"

  get "/admin", to: "admin#index"
  get "/admin/expenses/" ,  to: "admin#expenses"
  post "/admin/expenses/" ,  to: "admin#expenses"

  delete "/logout", to: "sessions#destroy"

  get "/home/main", to: "home#main"

end
