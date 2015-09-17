class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find_by(id: params[:id])
  end

  def find
    respond_with Item.find_by_attribute(item_params)
  end

  def find_all
    respond_with Item.find_all_by_attribute(item_params)
  end

  def random
    respond_with Item.order("RANDOM()").first
  end

  def invoice_items
    respond_with Item.find_invoice_items(item_params)
  end

  def merchant
    respond_with Item.find_merchant(item_params)
  end

  def most_revenue
    respond_with Item.top_revenue(params[:quantity].to_i)
  end

  def most_items
    respond_with Item.top_items(params[:quantity].to_i)
  end

  private

  def item_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end
