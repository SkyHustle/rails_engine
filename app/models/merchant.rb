class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices

  def self.find_by_attribute(params)
    where(params).first
  end

  def self.find_all_by_attribute(params)
    where(params)
  end

  def self.find_merchant_items(params)
    where(params).first.items
  end

  def self.find_merchant_invoices(params)
    where(params).first.invoices
  end

  def self.top_revenue(quantity)
    merchants_sort_by_revenue = all.sort_by do |merchant|
      merchant.invoices.successful.joins(:invoice_items).sum('quantity * unit_price')
    end
    merchants_sort_by_revenue.reverse.first(quantity)
  end

  def self.most_items_sold(quantity)
    merchant_sort_by_items = all.sort_by do |merchant|
      merchant.invoices.successful.joins(:invoice_items).sum('quantity')
    end
    merchant_sort_by_items.reverse.first(quantity)
  end

  def self.total_revenue_for_date(date)
    { "total_revenue" => Invoice.all.successful.where(created_at: date).joins(:invoice_items).sum("quantity * unit_price") }
  end

  def merchant_revenue
    { "revenue" => invoices.successful.joins(:invoice_items).sum("quantity * unit_price") }
  end

  def revenue_for_date(date)
    { "revenue" => invoices.successful.where(created_at: date).joins(:invoice_items).sum("quantity * unit_price") }
  end
end
