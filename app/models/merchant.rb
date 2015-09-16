class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices

  def self.find_by_attribute(params)
    where(params).first
  end

  def self.find_all_by_attribute(params)
    where(params)
  end

  def self.find_merchant_items(params)
    where(params).first.items
  end

  def self.find_merchant_invoices(params)
    where(params).first.invoices
  end
end
