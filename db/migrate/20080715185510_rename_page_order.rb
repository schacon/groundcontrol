class RenamePageOrder < ActiveRecord::Migration
  def self.up
    rename_column :pages,  :order,     :position
  end

  def self.down
    rename_column :pages,  :position,  :order
  end
end
