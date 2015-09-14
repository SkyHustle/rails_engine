class InvoiceItem < ActiveRecord::Base
  belong_to :invoices
  belong_to :items
end
