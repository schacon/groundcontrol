namespace :db do
  desc "destroy and recreate the database for the current RAILS_ENV and load rspec fixtures"
  task(:bootstrap => [:environment]) do
    Rake::Task[:"db:reset"]             .invoke
    Rake::Task[:"db:fixtures:load"]     .invoke
    Rake::Task[:"spec:db:fixtures:load"].invoke
  end
end
