class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.find_by_attribute(params)
    value = params.values.first
    key   = params.keys.first

    return Item.find_by(key => value)

    # if params[:name]
    #   return Item.find_by_name(params[:name])
    # elsif params[:description]
    #   return Item.find_by_description(params[:description])
    # elsif params[:unit_price]
    #   return Item.find_by_unit_price(prams[:unit_price])
    # elsif params[:merchant_id]
    #   return Item.find_by_merchant_id(params[:merchant_id])
    # end
  end

  def self.find_all_by_attribute(params)
    value = params.values.first
    key   = params.keys.first

    return Item.where(key => value)
  end
end
