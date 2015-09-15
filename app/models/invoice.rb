class Invoice < ActiveRecord::Base
  has_many   :transactions
  has_many   :invoice_items
  has_many   :items, through: :invoice_items
  belongs_to :customer
  belongs_to :merchant

  def self.find_by_attribute(params)
    value = params.values.first
    key   = params.keys.first

    return Invoice.find_by(key => value)

    # if params[:customer_id]
    #   return Invoice.find_by_customer_id(params[:customer_id])
    # elsif params[:merchant_id]
    #   return Invoice.find_by_merchant_id(params[:merchant_id])
    # elsif params[:status]
    #   return Invoice.find_by_status(params[:status])
    # end
  end

  def self.find_all_by_attribute(params)
    value = params.values.first
    key   = params.keys.first

    return Invoice.where(key => value)
  end
end
