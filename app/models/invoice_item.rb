class InvoiceItem < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :item

  # default_scope {order("id DESC")}

  def self.find_by_attribute(params)
    where(params).first
  end

  def self.find_all_by_attribute(params)
    where(params)
  end

  def self.find_invoice(params)
    where(params).first.invoice
  end

  def self.find_item(params)
    where(params).first.item
  end
end
