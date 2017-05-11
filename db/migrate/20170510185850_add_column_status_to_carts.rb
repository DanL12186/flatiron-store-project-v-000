class AddColumnStatusToCarts < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :status, :string
  end
end
