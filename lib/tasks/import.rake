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
    Item.create!(row.to_hash)
  end

  CSV.foreach(file_2, headers: true, header_converters: :symbol) do |row|
    InvoiceItem.create!(row.to_hash)
  end

  CSV.foreach(file_6, headers: true, header_converters: :symbol) do |row|
    Transaction.create!(row.to_hash.except(:credit_card_expiration_date))
  end

end
