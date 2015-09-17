class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items


  def self.find_by_attribute(params)
    where(params).first
  end

  def self.find_all_by_attribute(params)
    where(params)
  end

  def self.find_invoice_items(params)
    where(params).first.invoice_items
  end

  def self.find_merchant(params)
    where(params).first.merchant
  end

  def self.top_revenue(quantity)
    ids_of_items = Invoice.successful.joins(:items).group(:item_id).
        sum(('quantity * invoice_items.unit_price / 100')).
        sort_by {|id_revenue_pair| id_revenue_pair.last}
        .reverse.first(quantity).map(&:first)

    ids_of_items.map do |item_id|
      Item.find(item_id)
    end
  end
end
