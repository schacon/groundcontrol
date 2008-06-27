class SshAndUrlLogins < ActiveRecord::Migration
  def self.up
    add_column :hosts, :url_username, :string
    add_column :hosts, :url_password, :string
    add_column :hosts, :ssh_username, :string
    add_column :hosts, :ssh_password, :string
  end

  def self.down
    remove_column :hosts, :url_username
    remove_column :hosts, :url_password
    remove_column :hosts, :ssh_username
    remove_column :hosts, :ssh_password
  end
end
