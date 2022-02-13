Rails.application.routes.draw do
  get 'project/show'
  resources 'project'
  resources 'manager'
  resources 'developer'
  resources 'qa'

  devise_for :users
  get 'home/index'
  get '/manager/addusers/:id', to: 'manager#addusers', as: 'add_users'
  get '/manager/project/:pid/addtoproject/:eid', to: 'manager#addtoproject', as: 'add_to_project'
  get '/manager/project/:pid/deletefromproject/:eid', to: 'manager#deletefromproject', as: 'delete_from_project'


  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
