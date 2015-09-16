require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase
  test "#show" do
    get :show, format: :json, id: Invoice.first.id

    invoice = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "shipped", invoice[:status]
  end

  test "#index" do
    get :index, format: :json

    invoices = JSON.parse(response.body, symbolize_names: true)
    invoice  = invoices.first

    assert_response :success
    assert_equal 2,         invoices.count
    assert_equal "shipped", invoice[:status]
  end

  test "#find" do
    get :find, format: :json, customer_id: Invoice.first.customer_id

    invoice = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
  end

  test "#find_all" do
    get :find_all, format: :json, id: Invoice.first.id

    invoices = JSON.parse(response.body, symbolize_names: true)
    invoice  = invoices.first

    assert_response :success
    assert_equal 1,         invoices.count
    assert_equal "shipped", invoice[:status]
  end

  test "#random" do
    get :random, format: :json

    invoice = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal Hash,  invoice.class
    assert_equal false, invoice.empty?
  end

  test "#invoice_transactions" do
    get :invoice_transactions, format: :json, id: Invoice.first.id

    invoices = JSON.parse(response.body, symbolize_names: true)
    invoice  = invoices.first

    assert_response :success
    assert_equal Array, invoices.class
    assert_equal Hash,  invoices.first.class
    assert_equal invoice[:id], Transaction.last.id
  end

  test "#invoice_items" do
    get :invoice_items, format: :json, id: Invoice.first.id

    invoices = JSON.parse(response.body, symbolize_names: true)
    invoice  = invoices.first

    assert_response :success
    assert_equal Array, invoices.class
    assert_equal Hash,  invoices.first.class
    assert_equal invoice[:id], InvoiceItem.last.id
  end

  test "#items" do
    get :items, format: :json, id: Invoice.first.id

    items = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
  end

  test "#customer" do
    get :customer, format: :json, id: Invoice.first.id

    customer = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal Hash,     customer.class
    assert_equal "Biggie", customer[:first_name]
  end

  test "#merchant" do
    get :merchant, format: :json, id: Invoice.first.id

    merchant = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal Hash,    merchant.class
    assert_equal "Apple", merchant[:name]
  end
end
