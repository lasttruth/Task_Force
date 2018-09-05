class AddUserIdToStatuses < ActiveRecord::Migration[5.1]
  def change
    add_column :statuses, :user_id, :integer
  end
end
