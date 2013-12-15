Bhl::Application.routes.draw do
  resources :log_activities, only: [:index]
  get  "log_activities/index"
  get  "log_activities/user_activities"
  resources :comments, only: [:create]
  match "comments/create" => "comments#create"
  match "comments/index" => "comments#index"
  match "comments/edit" => "comments#edit"
  match "comments/delete" => "comments#delete"
  get  "comments/mark"
  match "mark" => "comments#mark"
  match "comments/reply" => "comments#reply"
  
  match "/user_search_history/save_query/" => "user_search_history#save_query"
  match "/user_search_history/delete_query/:id" => "user_search_history#delete_query"
  resources :user_search_history, only: [:save_query, :delete_query]
  resources :collections, only: [:index]
  match "/collections/destroy_collection/:id" => "collections#destroy_collection"
  match "/collections/edit/:id" => "collections#edit"
  match "/collections/show/:id" => "collections#show"
  match "/collections/update/:id" => "collections#update"
  match "/collections/delete_book/:book_collection_id" => "collections#delete_book"
  match "/collections/move_up/:book_collection_id" => "collections#move_up"
  match "/collections/move_down/:book_collection_id" => "collections#move_down"
  match "dialog_content" => "collections#dialog_content"
    
  resources :collections
  get "collections/add_book"
  match "add_book" => "collections#add_book"

  resources :books, only: [:index, :show]
  match "/books/:id" => "books#show"
  match "/books/:id/:tab" => "books#show"
  
  resources :ubio, only: [:index]
  
  match "browse/:type" => "browse#show"
  match "browse/:type/:char" => "browse#show" 
  
  resources :users, only: [:new, :create, :update, :edit]
  get   "users/logout"
  get   "users/login"
  match "users/activate/:guid/:activation_code" => "users#activate"
  get   "users/forgot_password"
  get   "users/change_password"
  get   "users/my_account"
  post  "users/validate"
  match "users/show/:id" => "users#show"
  match "/users/:id/:tab" => "users#show"
  post  "users/recover_password"
  match "users/reset_password/:guid/:activation_code" => "users#reset_password"
  post  "users/reset_password_action"
  get   "users/remove_book_history"
  match "users/rate" => "users#rate"
  match "users/rate_collection" => "users#rate_collection"
  
  # remove when how page is ready
  root :to => 'pages#about'
  
  get   "pages/contact"
  match "/pages/send_message" => "pages#send_message"
  get   "pages/about"
  
  match "browse/:type" => "browse#show"
  match "browse/:type/:char" => "browse#show" 
  
  match "/autocomplete" => "books#autocomplete"
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
