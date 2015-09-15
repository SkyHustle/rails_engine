require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase
  test "#show" do
    get :show, format: :json, id: Invoice.first.id

    invoice = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 1,         invoice[:customer_id]
    assert_equal 76,        invoice[:merchant_id]
    assert_equal "shipped", invoice[:status]
  end
end
