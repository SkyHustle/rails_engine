class Transaction < ActiveRecord::Base
  belongs_to :invoice

  def self.find_by_attribute(params)
    value = params.values.first
    key   = params.keys.first

    return Transaction.find_by(key => value)

    # if params[:invoice_id]
    #   return Transaction.find_by_invoice_id(params[:invoice_id])
    # elsif params[:credit_card_number]
    #   return Transaction.find_by_credit_card_number(params[:credit_card_number])
    # elsif params[:result]
    #   return Transaction.find_by_result(params[:result])
    # end
  end

  def self.find_all_by_attribute(params)
    value = params.values.first
    key   = params.keys.first

    return Transaction.where(key => value)
  end
end
