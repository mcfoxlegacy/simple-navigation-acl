Rails.application.routes.draw do


  namespace :simple_navigation_acl do

    get 'permissions/:id/edit', to: 'permissions#edit', as: 'edit'
    get 'permissions/:id', to: 'permissions#show', as: 'show'
    match 'permissions/:id', to: 'permissions#update', via: [:patch, :put], as: 'save'

    # get 'widgets/load/:widget_name/:widget_action', to: 'widgets#load', as: 'load'
    # get 'widgets/user(/:id)', to: 'widgets#user', as: 'user'
    # put 'widgets/save', to: 'widgets#save', as: 'save'

  end






end
