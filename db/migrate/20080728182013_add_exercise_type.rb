class AddExerciseType < ActiveRecord::Migration
  def self.up
    add_column     :exercises,  :exercise_type,   :string,  :limit => 30
  end

  def self.down
    remove_column  :exercises,  :exercise_type
  end
end
