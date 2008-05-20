class CreateTesterRuns < ActiveRecord::Migration
  def self.up
    create_table :tester_runs do |t|
      t.text :results_data
      t.integer :tester_id
      t.integer :results_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tester_runs
  end
end
