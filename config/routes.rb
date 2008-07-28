ActionController::Routing::Routes.draw do |map|
  map.resources :pages

  map.resources :pages
  map.resources :hosts
  map.resources :roles

  map.root :controller => "main"
  
  # named routes
  map.run_exercise 'hosts/run_exercise/:id/:test_type', 
      :controller => 'hosts', :action => 'run_exercise'
  
  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
