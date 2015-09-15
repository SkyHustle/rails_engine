class Api::V1::MerchantsController < ApplicationController
  respond_to :json

  def show
    respond_with Merchant.find_by(id: params[:id])
  end

  def find
    if params[:name]
      respond_with Merchant.find_by_name(params[:name])
    elsif params[:id]
      respond_with Merchant.find_by_id(params[:id])
    end
  end
end
