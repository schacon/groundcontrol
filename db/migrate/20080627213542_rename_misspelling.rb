class RenameMisspelling < ActiveRecord::Migration
  def self.up
    rename_table :excercises, :exercises
  end

  def self.down
    rename_table :exercises, :excercises
  end
end
