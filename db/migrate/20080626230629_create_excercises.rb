class CreateExcercises < ActiveRecord::Migration
  
  def self.up
    
    create_table :roles do |t|
      t.string :role
    end
    
    create_table :hosts do |t|
      t.string :hostname
      t.string :url
      t.integer :role_id
    end
    
    create_table :excercises do |t|
      t.integer :host_id
      t.integer :passed, :failed
      t.integer :users
      t.integer :samples
      t.timestamps
    end
    add_index :excercises, :host_id
    
    create_table :pages do |t|
      t.string :path
      t.integer :role_id
      t.integer :order
      t.string :assertions
      t.string :variables
      t.string :section
    end  
    add_index :pages, :role_id
    
    create_table :samples do |t|
      t.integer :excercise_id
      t.integer :page_id
      t.boolean :passed
      t.integer :user, :length => 1
      t.integer :response
      t.float   :time
      t.timestamps
    end
    add_index :samples, [:excercise_id, :page_id]
  end

  def self.down
    drop_table :roles
    drop_table :pages
    drop_table :hosts
    drop_table :excercises
    drop_table :samples
  end
  
end
