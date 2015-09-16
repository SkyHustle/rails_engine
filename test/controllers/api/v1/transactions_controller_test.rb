require 'test_helper'

class Api::V1::TransactionsControllerTest < ActionController::TestCase
  test "#show" do
    get :show, format: :json, id: Transaction.first.id

    transaction = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "4411510861233607", transaction[:credit_card_number]
    assert_equal "failed",           transaction[:result]
  end
end
