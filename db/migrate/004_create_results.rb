class CreateResults < ActiveRecord::Migration
  def self.up
    create_table :results do |t|
      t.integer :project_id
      t.string :integration_code
      t.string :speed_code
      t.text :results

      t.timestamps
    end
  end

  def self.down
    drop_table :results
  end
end
