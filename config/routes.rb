Bhl::Application.routes.draw do
  resources :books
  resources :ubio#, only[:index]
  resources :browse
  
  resources :users, only: [:new, :create, :update, :edit]
  match "users/logout" => "users#logout"
  match "users/login" => "users#login"
  match "users/activate/:guid/:activation_code" => "users#activate"
  match "users/forgot_password" => "users#forgot_password"
  match "users/change_password" => "users#change_password"
  match "users/my_account" => "users#my_account"
  post "users/validate" => 'users#validate'
  match "users/show/:id" => "users#show"
  
  # remove when how page is ready
  root :to => 'pages#about'
  
  get   "pages/contact"
  get   "pages/about"
  
  match "browse/:type" => "browse#show"
  match "browse/:type/:char" => "browse#show" 
  
  match "/books/:id" => "books#show"
  match "/books/:id/:tab" => "books#show"
  
  get   "geographics/index"
  match "/geographics/show/:id" => "geographics#show"
  match "/geographics/index/:range" => "geographics#index"
  
  match "names" => redirect("names/index")
  get   "names/index"
  get   "names/show"
  match "names/get_content/:id" => "names#get_content"
end
