class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices

  def self.find_by_attribute(params)
    where(params).first
  end

  def self.find_all_by_attribute(params)
    where(params)
  end

  def self.find_invoices(params)
    where(params).first.invoices
  end

  def self.find_transactions(params)
    where(params).first.transactions
  end
end
