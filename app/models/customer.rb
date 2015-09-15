class Customer < ActiveRecord::Base
  has_many :invoices

    def self.find_by_attribute(params)
      value = params.values.first
      key   = params.keys.first

      Customer.where("#{key} ILIKE ?", "#{value}").first

    # return Customer.find_by(key => value)

    # if params[:first_name]
    #   return Customer.find_by_first_name(params[:first_name])
    # elsif params[:last_name]
    #   return Customer.find_by_last_name(params[:last_name])
    # end
  end

  def self.find_all_by_attribute(params)
    value = params.values.first
    key   = params.keys.first

    return Customer.where(key => value)
  end
end
