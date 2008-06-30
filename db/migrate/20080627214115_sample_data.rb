class SampleData < ActiveRecord::Migration
  def self.up
    add_column :samples, :page_data, :string
    add_column :samples, :page_size, :integer
  end

  def self.down
    remove_column :samples, :page_data
    remove_column :samples, :page_size
  end
end
