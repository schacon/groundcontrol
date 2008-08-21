ActionController::Routing::Routes.draw do |map|
  map.resources :stacks

  map.resources :pages

  map.resources :pages
  map.resources :hosts
  map.resources :roles

  map.root :controller => "main"
  
  # named routes
  map.exercise_performance '/hosts/:id/exercise_performance', :controller => 'hosts', :action => 'exercise_performance'
  map.exercise_memory      '/hosts/:id/exercise_memory',      :controller => 'hosts', :action => 'exercise_memory'
  
  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
