require 'test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase
  test "#show" do
    get :show, format: :json, id: InvoiceItem.first.id

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 532,       invoice_item[:item_id]
    assert_equal 8,         invoice_item[:quantity]
    assert_equal "34873.0", invoice_item[:unit_price]
  end

  test "#index" do
    get :index, format: :json

    invoice_items = JSON.parse(response.body, symbolize_names: true)
    invoice_item  = invoice_items.first

    assert_response :success
    assert_equal 2,   invoice_items.count
    assert_equal 539, invoice_item[:item_id]
  end

  test "#find" do
    get :find, format: :json, id: InvoiceItem.first.id

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "34873.0", invoice_item[:unit_price]
  end

  test "#find_all" do
    get :find_all, format: :json, id: InvoiceItem.first.id

    invoice_items = JSON.parse(response.body, symbolize_names: true)
    invoice_item  = invoice_items.last

    assert_response :success
    assert_equal 1,           invoice_items.count
    assert_equal "34873.0",   invoice_item[:unit_price]
  end

  test "#random" do
    get :random, format: :json

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal Hash,  invoice_item.class
    assert_equal false, invoice_item.empty?
  end

  test "#invoice" do
    get :invoice, format: :json, id: InvoiceItem.first.id

    invoices = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal Hash, invoices.class
  end

  test "#item" do
    skip
    get :item, format: :json, id: InvoiceItem.first.id

    items = JSON.parse(response.body, symbolize_names: true)
    assert_response :success
    assert_equal Hash, items.class
  end
end
