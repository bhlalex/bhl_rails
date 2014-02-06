Bhl::Application.routes.draw do
  scope "(:locale)", :locale => /en|ar/ do
    get "activities/index"
    
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
    get   "user_search_history/remove_book_history"
    resources :user_search_history, only: [:save_query, :delete_query]
    
    resources :collections
    match "/collections/destroy_collection/:id" => "collections#destroy_collection"
    match "/collections/edit/:id" => "collections#edit"
    match "/collections/:id" => "collections#show"
    match "/collections/update/:id" => "collections#update"
    match "/collections/delete_book/:volume_collection_id" => "collections#delete_book"
    match "/collections/move_up/:volume_collection_id" => "collections#move_up"
    match "/collections/move_down/:volume_collection_id" => "collections#move_down"
    match "dialog_content" => "collections#dialog_content"
    match "get_collection_comments" => "collections#get_collection_comments"
    match "get_collection_photo" => "collections#get_collection_photo"
    get "collections/add_book"
    match "add_book" => "collections#add_book"
    match "/collectionautocomplete" => "collections#autocomplete"
    
    resources :books, only: [:index, :show]
    #match "books/:id" => "books#show"
    #match "books/:id/:tab" => "books#show"  
    match "/autocomplete" => "books#autocomplete"
    match "/books/:id" => "books#show"
    match "/books/:id/:tab" => "books#show"
    match "/rating" => "books#rating"
    match "/get_volume_rate" => "books#get_volume_rate"
    match "/get_detailed_rate" => "books#get_detailed_rate"
    # match "get_collections" => "books#get_collections"
    match "get_carousel" => "books#get_carousel"
    match "get_comments" => "books#get_comments"
    
    
    resources :ubio, only: [:index]
    
    match "browse/:type" => "browse#show"
    match "browse/:type/:char" => "browse#show" 
    match "browse/:type" => "browse#show"
    match "browse/:type/:char" => "browse#show"
    match "/browseautocomplete" => "browse#autocomplete"
    resources :users, only: [:new, :create, :update, :edit]
    post  "users/recover_password"
    post  "users/reset_password_action"
    get   "users/logout"
    get   "users/login"
    get   "users/forgot_password"
    get   "users/change_password"
    get   "users/my_account"
    post  "users/validate"
    match "users/activate/:guid/:activation_code" => "users#activate"
    match "users/:id" => "users#show"
    match "/users/:id/:tab" => "users#show"
    match "users/reset_password/:guid/:activation_code" => "users#reset_password"
    match "/rate" => "users#rate"
    match "/rate_collection" => "users#rate_collection"
    match "get_user_profile_photo" => "users#get_user_profile_photo"
  
  
    
    # remove when how page is ready
    root :to => 'pages#home'
    get   "pages/home"
    
    get   "pages/contact"
    match "/pages/send_message" => "pages#send_message"
    get   "pages/about"
    match "get_activity_log" => "pages#get_activity_log"
    
    match "browse/:type" => "browse#show"
    match "browse/:type/:char" => "browse#show" 
  
    get   "geographics/index"
    match "/geographics/show/:id" => "geographics#show"
    match "/geographics/index/:range" => "geographics#index"
    
    get   "names/index"
    get   "names/show"
    match "names/get_content/:id" => "names#get_content"
    
    get "darviewer/user"
    get "darviewer/book"
    get "darviewer/annotations"
    
    get "log_activities/index"
    
  end
end
