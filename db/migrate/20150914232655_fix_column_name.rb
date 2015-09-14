class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :transactions, :results, :result
  end
end
