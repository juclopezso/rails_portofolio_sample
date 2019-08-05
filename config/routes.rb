Rails.application.routes.draw do
  #CUSTOM ROUTES TO DEVISE
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register'
  }
  #to show portofolio/:id instead of portofolios/:id
  resources :portofolios, except: [:show]
  get 'portofolio/:id', to: 'portofolios#show', as: 'portofolio_show'
  get 'portofolios/angular', to: 'portofolios#angular'
  get 'about-me', to: 'pages#about'
  # 'name_of_controller / action'
  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Set the root to pages#home
  root to: 'pages#home'
end
 