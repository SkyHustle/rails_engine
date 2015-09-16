require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase
  test "#show" do
    get :show, format: :json, id: Transaction.first.id

    transaction = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "4411510861233607", transaction[:credit_card_number]
    assert_equal "failed",           transaction[:result]
  end

  test "#index" do
    get :index, format: :json

    transactions = JSON.parse(response.body, symbolize_names: true)
    transaction  = transactions.first

    assert_response :success
    assert_equal 2,         transactions.count
    assert_equal "success", transaction[:result]
  end

  test "#find" do
    get :find, format: :json, invoice_id: Transaction.first.invoice_id

    transaction = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
  end

  test "#find_all" do
    get :find_all, format: :json, id: Transaction.first.id

    transactions = JSON.parse(response.body, symbolize_names: true)
    transaction  = transactions.last

    assert_response :success
    assert_equal 1,         transactions.count
    assert_equal "failed", transaction[:result]
  end

  test "#random" do
    get :random, format: :json

    invoice = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal Hash,  invoice.class
    assert_equal false, invoice.empty?
  end

  test "#invoice" do
    get :invoice, format: :json, id: Transaction.first.id

    transactions = JSON.parse(response.body, symbolize_names: true)
    transaction  = transactions.first

    assert_response :success
    assert_equal Hash, transactions.class
  end
end
