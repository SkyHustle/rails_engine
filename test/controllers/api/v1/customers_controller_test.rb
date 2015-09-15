require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase
  test "#show" do
    get :show, format: :json, id: Customer.first.id

    customer = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Tupac", customer[:first_name]
    assert_equal "Shakur", customer[:last_name]
  end
end
