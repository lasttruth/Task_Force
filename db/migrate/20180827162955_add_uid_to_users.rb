class AddUidToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :Users, :uid, :string
  end
end
