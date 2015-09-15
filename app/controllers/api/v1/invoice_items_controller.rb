class Api::V1::InvoiceItemsController < ApplicationController
  respond_to :json

  def show
    respond_with InvoiceItem.find_by(id: params[:id])
  end

  def find
    respond_with InvoiceItem.find_by_attribute(params)
  end

  def find_all
    respond_with InvoiceItem.find_all_by_attribute(params)
  end

  def random
    respond_with InvoiceItem.order("RANDOM()").first
  end
end
