class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
      t.integer :quantity, default: 0
      t.integer :cart_id
      t.integer :item_id
    end
  end
end
