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
end
