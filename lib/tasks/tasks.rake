namespace :db do
  desc "destroy and recreate the database from db/schema.rb and load fixtures (respects the RAILS_ENV)"
  task(:bootstrap => [:environment]) do
    Rake::Task[:"db:reset"]             .invoke
    Rake::Task[:"db:fixtures:load"]     .invoke
    Rake::Task[:"spec:db:fixtures:load"].invoke
  end
end
