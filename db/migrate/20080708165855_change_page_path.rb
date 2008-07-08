class ChangePagePath < ActiveRecord::Migration
  def self.up
    rename_column :pages, :path,        :uri_pattern
    add_column    :pages, :uri_actual,  :string,      :limit => 255
  end

  def self.down
    remove_column :pages, :uri_actual
    rename_column :pages, :uri_pattern, :path
  end
end
