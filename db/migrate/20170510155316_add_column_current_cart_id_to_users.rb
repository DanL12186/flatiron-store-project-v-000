class AddColumnCurrentCartIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :current_cart_id, :integer
  end
end
