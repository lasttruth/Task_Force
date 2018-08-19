class CreateTrackers < ActiveRecord::Migration[5.1]
  def change
    create_table :trackers do |t|
      t.integer :progress
      t.boolean :completion, :default => false
      t.timestamps
    end
  end
end
