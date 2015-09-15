class Api::V1::CustomersController < ApplicationController
  respond_to :json

  def show
    respond_with Customer.find_by(id: params[:id])
  end

  def find
    respond_with Customer.find_by_attribute(params)
  end

  def find_all
    respond_with Customer.find_all_by_attribute(params)
  end

  def random
    respond_with Customer.order("RANDOM()").first
  end
end
