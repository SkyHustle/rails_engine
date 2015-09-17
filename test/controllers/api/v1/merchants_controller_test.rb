require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test "#show" do
    get :show, format: :json, id: Merchant.first.id

    merchant = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Microsoft", merchant[:name]
  end

  test "#index" do
    get :index, format: :json

    merchants = JSON.parse(response.body, symbolize_names: true)
    merchant  = merchants.first

    assert_response :success
    assert_equal 2,         merchants.count
    assert_equal "Apple", merchant[:name]
  end

  test "#find" do
    get :find, format: :json, id: Merchant.first.id

    merchant = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Microsoft", merchant[:name]
  end

  test "#find_all" do
    get :find_all, format: :json, id: Merchant.first.id

    merchants = JSON.parse(response.body, symbolize_names: true)
    merchant  = merchants.last

    assert_response :success
    assert_equal 1,           merchants.count
    assert_equal "Microsoft", merchant[:name]
  end

  test "#random" do
    get :random, format: :json

    merchant = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal Hash,  merchant.class
    assert_equal false, merchant.empty?
  end

  test "#merchant_items" do
    get :merchant_items, format: :json, id: Merchant.first.id

    items     = JSON.parse(response.body, symbolize_names: true)
    item      = items.first

    assert_response :success
    assert_equal Array, items.class
    assert_equal "Item Autem Minima", item[:name]
  end

  test "#merchant_invoices" do
    get :merchant_invoices, format: :json, id: Merchant.first.id

    invoices = JSON.parse(response.body, symbolize_names: true)
    invoice  = invoices.first

    assert_response :success
    assert_equal Array, invoices.class
    assert_equal "shipped", invoice[:status]
  end

  test "#most_revenue" do
    get :most_revenue, format: :json, quantity: 2

    invoices = JSON.parse(response.body, symbolize_names: true)
    invoice  = invoices.first

    assert_response :success
    assert_equal Array, invoices.class
  end

  test "#most_items" do
    get :most_items, format: :json, quantity: 2

    invoices = JSON.parse(response.body, symbolize_names: true)
    invoice  = invoices.first

    assert_response :success
    assert_equal Array, invoices.class
  end

  test "#revenue_by_date" do
    get :revenue_by_date, format: :json, date: "2012-03-27 14:53:59 UTC"

    total_revenue = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal Hash, total_revenue.class
  end

  test "#single_merchant_revenue" do
    get :single_merchant_revenue, format: :json, id: Merchant.first.id

    total_revenue = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal Hash, total_revenue.class
  end

  test "#single_merchant_revenue_for_date" do
    get :single_merchant_revenue_for_date, format: :json, id: Merchant.first.id, date: "2012-03-27 14:53:59 UTC"

    total_revenue = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal Hash, total_revenue.class
  end

  test "#favorite_customer" do
    get :favorite_customer, format: :json, id: Merchant.last.id

    favorite_customer = JSON.parse(response.body, symbolize_names: true)
    assert_response :success

    assert_equal Hash, favorite_customer.class
    assert_equal "Smalls", favorite_customer[:last_name]
  end
end
