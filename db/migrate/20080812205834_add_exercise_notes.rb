class AddExerciseNotes < ActiveRecord::Migration
  def self.up
    add_column    :exercises,  :aut_version,  :string,  :limit => 50
    add_column    :exercises,  :aut_note,     :string,  :limit => 2000
  end

  def self.down
    remove_column :exercises,  :aut_version
    remove_column :exercises,  :aut_note
  end
end
