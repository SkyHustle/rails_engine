require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "#show" do
    get :show, format: :json, id: Item.first.id

    item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Item Qui Esse",           item[:name]
    assert_equal "Nihil autem sit odio",    item[:description]
    assert_equal "75107.0",                 item[:unit_price]
  end
end
