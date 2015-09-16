class Transaction < ActiveRecord::Base
  belongs_to :invoice

  def self.find_by_attribute(params)
    where(params).first
  end

  def self.find_all_by_attribute(params)
    where(params)
  end

  def self.find_invoice(params)
    where(params).first.invoice
  end
end
