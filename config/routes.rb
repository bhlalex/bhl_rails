Bhl::Application.routes.draw do
  resources :books
  resources :ubio#, only[:index]
  resources :browse
  
  resources :users, only: [:new, :create, :update, :edit]
  get   "users/logout"
  get   "users/login"
  match "users/activate/:guid/:activation_code" => "users#activate"
  get   "users/forgot_password"
  get   "users/change_password"
  get   "users/my_account"
  post  "users/validate"
  match "users/show/:id" => "users#show"
  post  "users/recover_password"
  match "users/reset_password/:guid/:activation_code" => "users#reset_password"
  post  "users/reset_password_action"
  
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
  
  get "darviewer/user"
  get "darviewer/book"
  get "darviewer/annotations"
end
