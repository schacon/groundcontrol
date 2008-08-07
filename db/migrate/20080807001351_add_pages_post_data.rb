class AddPagesPostData < ActiveRecord::Migration
  def self.up
    add_column :pages, :post_data, :text
  end

  def self.down
    remove_column :pages, :post_data
  end
end
