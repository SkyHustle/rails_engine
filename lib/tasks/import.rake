require 'csv'

desc "Import CSV files into an ActiveRecord table"
task :import => :environment do

  file_1 = "db/csv/customers.csv"
  file_2 = "db/csv/invoice_items.csv"
  file_3 = "db/csv/invoices.csv"
  file_4 = "db/csv/items.csv"
  file_5 = "db/csv/merchants.csv"
  file_6 = "db/csv/transactions.csv"

  CSV.foreach(file_5, headers: true, header_converters: :symbol) do |row|
    Merchant.create!(row.to_hash)
  end

  CSV.foreach(file_1, headers: true, header_converters: :symbol) do |row|
    Customer.create!(row.to_hash)
  end

  CSV.foreach(file_3, headers: true, header_converters: :symbol) do |row|
    Invoice.create!(row.to_hash)
  end

  CSV.foreach(file_4, headers: true, header_converters: :symbol) do |row|
    Item.create!({:id          => row[:id],
                  :name        => row[:name],
                  :description => row[:description],
                  :unit_price  => row[:unit_price].to_f / 100,
                  :merchant_id => row[:merchant_id],
                  :created_at  => row[:created_at],
                  :updated_at  => row[:updated_at]
                 })
  end

  CSV.foreach(file_2, headers: true, header_converters: :symbol) do |row|
    InvoiceItem.create!({:id         => row[:id],
                         :item_id    => row[:item_id],
                         :quantity   => row[:quantity],
                         :unit_price => row[:unit_price].to_f / 100,
                         :created_at => row[:created_at],
                         :updated_at => row[:updated_at]
                        })
  end

  CSV.foreach(file_6, headers: true, header_converters: :symbol) do |row|
    Transaction.create!(row.to_hash.except(:credit_card_expiration_date))
  end

end
