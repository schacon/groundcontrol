ActionController::Routing::Routes.draw do |map|
  map.resources :pages

  map.resources :pages
  map.resources :hosts
  map.resources :roles

  map.root :controller => "main"
  
  # named routes
  map.exercise_performance '/hosts/:id/exercise_performance', :controller => 'hosts', :action => 'exercise_performance'
  map.memory_exercise      '/hosts/:id/run_memory_exercise',      :controller => 'hosts', :action => 'run_memory_exercise'
  
  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
