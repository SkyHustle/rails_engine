class InvoiceItem < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :item

  def self.find_by_attribute(params)
    if params[:item_id]
      return InvoiceItem.find_by_item_id(params[:item_id])
    elsif params[:invoice_id]
      return InvoiceItem.find_by_invoice_id(params[:invoice_id])
    elsif params[:quantity]
      return InvoiceItem.find_by_quantity(params[:quantity])
    elsif params[:unit_price]
      return InvoiceItem.find_by_unit_price(params[:unit_price])
    end
  end
end
