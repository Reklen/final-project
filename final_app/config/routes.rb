Rails.application.routes.draw do
  root to: "homes#index"

  #get "/students", to: "students#index", as: "students"
  #get "/students/new", to: "students#new", as: "new_student"
  #post "/students", to: "students#create"
  #get "/students/:id/edit", to: "students#edit"
  #patch "/students/:id/edit", to: "students#update"
  #put "/students/:id/edit", to: "students#update"
  #get "/students/:id", to: "students#show"
  #post "/students/:id/mentor_list", to: "students#select_mentor"
  ##patient selects physician during sign up##
  #get "/students/:id/mentor_list", to: "students#mentor_list", as: "mentor_list"
  #associate patient-id with doctor-id'
  #post "/students/:id/mentor_list", to: "students#select_mentor", as: "select_mentor_student"

  resources :students

  get "/sessions/new", to: "sessions#new"

  post "/sessions", to: "sessions#create"

  get "/sign_up", to: "students#new"

  delete "/session", to: "sessions#destroy"

  get "/mentors", to: "mentors#index"

  get "/mentors/new", to: "mentors#new", as: "new_mentor"

  get "/mentors/:id", to: "mentors#show"


  post "/mentors", to: "mentors#create"

  get "/mentors/:id/edit", to: "mentors#edit"

  patch "/mentors/:id/edit", to: "mentors#update"

  put "/mentors/:id/edit", to: "mentors#update"

  # get "/mentor/:id/edit(.:format)", to: "users#edit"

  # get "/students/:student_id/mentors", to: "student_mentors#index", as: "mentor_students"

  # post "/mentors/:mentor_id/students", to: "student_mentors#create", as: "student_mentors"


end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

