class SaveActualPageUri < ActiveRecord::Migration
  def self.up
    rename_column :pages,   :path,        :uri_pattern
    add_column    :samples, :page_uri,    :string,      :limit => 255
  end

  def self.down
    remove_column :samples, :page_uri
    rename_column :pages,   :uri_pattern, :path
  end
end
