Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'settings' }

  resources :projects, only: [:create, :destroy]
  get '/new/project', to: 'projects#new', as: 'new_project'
  get '/project/:id', to: 'projects#show', as: 'show_project'
  get '/project/:id/edit', to: 'projects#edit', as: 'edit_project'
  patch '/projects/:id', to: 'projects#update', as: 'update_project'
  post '/projects/:id', to: 'projects#update_project_status', as:'lock_project'

  post "project/registration/:id", to: "projects#register", as: 'project_registration'
  post "project/unregister/:id", to: "projects#unregister", as: 'project_unregister'
  post "project/unregister/:id/user/:id", to: "projects#project_creator_unregister_user", as: 'project_creator_unregister_user'

  resources :comments
  
  get 'visitor/index', to: 'visitor#index', as: 'index_visitor'
  get 'visitor/show/:id', to: 'visitor#show', as: 'show_visitor'

end
