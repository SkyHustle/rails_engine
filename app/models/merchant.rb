class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices

  def self.find_by_attribute(params)
    if params[:name]
      return Merchant.find_by_name(params[:name])
    elsif params[:id]
      return Merchant.find_by_id(params[:id])
    end
  end
end
