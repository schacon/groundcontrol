class AlterSampleMemory < ActiveRecord::Migration
  def self.up
    rename_column  :samples,  :memory,          :changed_memory
    add_column     :samples,  :total_memory,    :float
  end

  def self.down
    rename_column  :samples,  :changed_memory,  :memory
    remove_column  :samples,  :total_memory
  end
end
