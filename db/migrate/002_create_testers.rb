class CreateTesters < ActiveRecord::Migration
  def self.up
    create_table :testers do |t|
      t.string :name
      t.text :description
      t.text :code
      t.integer :project_id
      t.integer :active_flag

      t.timestamps
    end
  end

  def self.down
    drop_table :testers
  end
end
