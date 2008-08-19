class CreateStacks < ActiveRecord::Migration
  def self.up
    create_table :stacks do |t|
      t.string      :name, :limit => 50
      t.timestamps
    end
    create_table :stacks_roles,  :id => false do |t|
      t.integer     :stack_id, :null => false
      t.integer     :role_id , :null => false
    end
    add_index :stacks_roles, [:stack_id, :role_id], :unique => true
  end

  def self.down
    drop_table :stacks_roles
    drop_table :stacks
  end
end
