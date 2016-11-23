Rails.application.routes.draw do


  namespace :simple_navigation_acl do

    get 'rules/:id/edit', to: 'rules#edit', as: 'edit'
    get 'rules/:id', to: 'rules#show', as: 'show'
    match 'rules/:id', to: 'rules#update', via: [:patch, :put, :post], as: 'save'

  end






end
