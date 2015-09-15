class Api::V1::TransactionsController < ApplicationController
  respond_to :json

  def index
    respond_with Transaction.all
  end

  def show
    respond_with Transaction.find_by(id: params[:id])
  end

  def find
    respond_with Transaction.find_by_attribute(params)
  end

  def find_all
    respond_with Transaction.find_all_by_attribute(params)
  end

  def random
    respond_with Transaction.order("RANDOM()").first
  end
end
