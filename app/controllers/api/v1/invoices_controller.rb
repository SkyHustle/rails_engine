class Api::V1::InvoicesController < ApplicationController
  respond_to :json

  def show
    respond_with Invoice.find_by(id: params[:id])
  end

  def find
    respond_with Invoice.find_by_attribute(params)
  end

  def find_all
    respond_with Invoice.find_all_by_attribute(params)
  end

  def random
    respond_with Invoice.order("RANDOM()").first
  end
end
