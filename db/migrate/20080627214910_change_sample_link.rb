class ChangeSampleLink < ActiveRecord::Migration
  def self.up
    rename_column :samples, :excercise_id, :exercise_id
    add_column :samples, :memory, :float
  end

  def self.down
    rename_column :samples, :exercise_id
    remove_column :samples, :memory
  end
end
