Rails.application.routes.draw do
  get 'project/show'
  resources 'project' do
    resources :users do
      get 'preview', on: :member, to: 'manager#addtoprojects'
    end
  end

  resources 'manager'
  resources 'developer' do
    get 'developer/explore/:id', to: 'developer#explore', as: 'dev_explore'
  end

  resources 'qa'

  devise_for :users
  get 'home/index'
  get '/project/:id/adduser/:id', to: 'manager#addusers', as: 'add_users'
  get '/manager/project/:pid/addtoproject/:eid', to: 'manager#addtoproject', as: 'add_to_project'
  get '/manager/project/:pid/deletefromproject/:eid', to: 'manager#deletefromproject', as: 'delete_from_project'

  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
