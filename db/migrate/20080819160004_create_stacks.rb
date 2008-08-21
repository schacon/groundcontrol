class CreateStacks < ActiveRecord::Migration
  def self.up
    create_table :stacks do |t|
      t.string      :name, :limit => 50
      t.timestamps
    end
    create_table :hosts_stacks,  :id => false do |t|
      t.integer     :stack_id, :null => false
      t.integer     :host_id , :null => false
    end
    add_index :hosts_stacks, [:stack_id, :host_id], :unique => true
  end

  def self.down
    drop_table :hosts_stacks
    drop_table :stacks
  end
end
