class ChangeIntegerColumnsToDecimal < ActiveRecord::Migration
  def change
    change_column :items, :unit_price, :decimal
    change_column :invoice_items, :unit_price, :decimal
  end
end
