class Invoice < ActiveRecord::Base
  has_many   :transactions
  has_many   :invoice_items
  has_many   :items, through: :invoice_items
  belongs_to :customer
  belongs_to :merchant

  def self.find_by_attribute(params)
    where(params).first
  end

  def self.find_all_by_attribute(params)
    where(params)
  end

  def self.find_transactions(params)
    where(params).first.transactions
  end

  def self.find_invoice_items(params)
    where(params).first.invoice_items
  end

  def self.find_items(params)
    where(params).first.items
  end

  def self.find_customer(params)
    where(params).first.customer
  end

  def self.find_merchant(params)
    where(params).first.merchant
  end

  def self.successful
    joins(:transactions).where("result = 'success'")
  end

   def self.failed
    joins(:transactions).where("result = 'failed'")
  end
end
