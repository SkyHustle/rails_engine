require 'test_helper'

class Api::V1::CustomersControllerTest < ActionController::TestCase
  test "#show" do
    get :show, format: :json, id: Customer.first.id

    customer = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Tupac", customer[:first_name]
    assert_equal "Shakur", customer[:last_name]
  end

  test "#index" do
    get :index, format: :json

    customers = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal 2,   customers.count
  end

  test "#find" do
    get :find, format: :json, id: Customer.first.id

    customer = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    # assert_equal "Tupac", customer[:firt_name]
  end

  test "#find_all" do
    get :find_all, format: :json, first_name: Customer.first.first_name

    customers = JSON.parse(response.body, symbolize_names: true)
    customer  = customers.last

    assert_response :success
    assert_equal 1,       customers.count
  end

  test "#random" do
    get :random, format: :json

    invoice_item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal Hash,  invoice_item.class
    assert_equal false, invoice_item.empty?
  end

  test "#invoices" do
    get :invoices, format: :json, id: Customer.first.id

    invoices = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal Array, invoices.class
    assert_equal "shipped", invoices.first[:status]
  end

  test "#transactions" do
    get :transactions, format: :json, id: Customer.first.id

    items = JSON.parse(response.body, symbolize_names: true)
    assert_response :success
    assert_equal Array, items.class
  end
end
