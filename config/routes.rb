Rails.application.routes.draw do

  namespace :admin do
    get 'dashboard/index'
  end

  namespace :admin do
    resources :posts
    resources :comments
  end

  resources :articles
  resources :likes
  resources :comments
  post '/preview', to: 'admin/posts#preview'
  post '/photos', to: 'photos#create'
  post '/main_photo', to: 'main_photo#create'

  post '/search', to: 'articles#search'
  get  '/search', to: 'articles#search'

  post '/signin', to: 'admin/sessions#create'
  get '/signin', to: 'admin/sessions#new'
  get '/signout', to: 'admin/sessions#destroy'

  get '/admin', to: 'admin/dashboard#index'

  get '/blog/rss', to: 'welcome#rss'
  get '/about', to: 'welcome#about'
  get '/team', to: 'welcome#team'
  get '/history', to: 'welcome#history'
  get '/contact', to: 'welcome#contact'
  get '/press', to: 'welcome#press'
  get '/photo', to: 'welcome#photo'
  get '/all', to: 'articles#index'
  root 'welcome#index'
end
