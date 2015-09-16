class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items


  def self.find_by_attribute(params)
    where(params).first
  end

  def self.find_all_by_attribute(params)
    where(params)
  end

  def self.find_invoice_items(params)
    where(params).first.invoice_items
  end

  def self.find_merchant(params)
    where(params).first.merchant
  end
end
