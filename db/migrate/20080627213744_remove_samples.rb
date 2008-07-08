class RemoveSamples < ActiveRecord::Migration
  def self.up
    remove_column :exercises, :samples
  end

  def self.down
    add_column :exercises, :samples, :integer
  end
end
