class CreateStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :statuses do |t|
      t.string :condition
      t.integer :completion
      t.integer :max_completion
      t.belongs_to :game, foreign_key: true
      t.timestamps
    end
  end
end
