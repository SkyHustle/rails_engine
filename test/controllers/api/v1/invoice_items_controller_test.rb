require 'test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase
  test "#show" do
    get :show, format: :json, id: InvoiceItem.first.id

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 532,       invoice_item[:item_id]
    assert_equal 1,         invoice_item[:invoice_id]
    assert_equal 8,         invoice_item[:quantity]
    assert_equal "34873.0", invoice_item[:unit_price]
  end
end
