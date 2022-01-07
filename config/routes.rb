# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Session
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # Pages
  get '/apps' => 'pages#apps', as: :apps
  pages = Dir.glob('app/views/pages/*.html.erb').map { |f| File.basename f }.map { |f| f.split('.').first }
  pages.each do |page|
    get "/apps/:id/#{page}" => "pages##{page}", as: "pages_#{page}"
  end

  # Defines the root path route ("/")
  root to: redirect('/apps')
end
