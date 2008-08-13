class AddExercisePerfParams < ActiveRecord::Migration
  def self.up
    add_column    :exercises,  :num_concurrent_connections,  :integer
    add_column    :exercises,  :num_hits_per_page,           :integer
  end

  def self.down
    remove_column :exercises,  :num_concurrent_connections
    remove_column :exercises,  :num_hits_per_page
  end
end
