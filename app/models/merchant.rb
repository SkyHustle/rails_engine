class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices

  def self.find_by_attribute(params)
    value = params.values.first
    key   = params.keys.first

    return Merchant.find_by(key => value)

    # if params[:name]
    #   return Merchant.find_by_name(params[:name])
    # elsif params[:id]
    #   return Merchant.find_by_id(params[:id])
    # end
  end

  def self.find_all_by_attribute(params)
    value = params.values.first
    key   = params.keys.first

    return Merchant.where(key => value)
  end
end
