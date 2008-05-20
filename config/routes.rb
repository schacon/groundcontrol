ActionController::Routing::Routes.draw do |map|
  map.resources :libraries
  map.resources :servers
  map.resources :roles
  map.resources :results
  map.resources :tester_runs
  map.resources :testers

  map.root :controller => "main"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
