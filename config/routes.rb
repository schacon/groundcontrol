ActionController::Routing::Routes.draw do |map|
  map.resources :pages
  map.resources :hosts
  map.resources :roles

  map.root :controller => "main"

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
