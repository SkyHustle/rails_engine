class Customer < ActiveRecord::Base
  has_many :invoices

  def self.find_by_attribute(params)
    if params[:first_name]
      return Customer.find_by_first_name(params[:first_name])
    elsif params[:last_name]
      return Customer.find_by_last_name(params[:last_name])
    end
  end
end
