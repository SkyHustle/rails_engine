class Api::V1::MerchantsController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.all
  end

  def show
    respond_with Merchant.find_by(id: params[:id])
  end

  def find
    respond_with Merchant.find_by_attribute(merchant_params)
  end

  def find_all
    respond_with Merchant.find_all_by_attribute(merchant_params)
  end

  def random
    respond_with Merchant.order("RANDOM()").first
  end

  def merchant_items
    respond_with Merchant.find_merchant_items(merchant_params)
  end

  def merchant_invoices
    respond_with Merchant.find_merchant_invoices(merchant_params)
  end

  def most_revenue
    respond_with Merchant.find_most_revenue(params[:quantity].to_i)
  end

  private

  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end
end
