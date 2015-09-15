class Customer < ActiveRecord::Base
  has_many :invoices

  def self.find_by_attribute(params)
    where(params).first
  end

  def self.find_all_by_attribute(params)
    where(params)
  end
end
