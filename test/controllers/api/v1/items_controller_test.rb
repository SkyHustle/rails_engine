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

  test "#index" do
    get :index, format: :json

    items = JSON.parse(response.body, symbolize_names: true)
    item  = items.first

    assert_response :success
    assert_equal 2,       items.count
    assert_equal "Item Qui Esse", item[:name]
  end

  test "#find" do
    get :find, format: :json, id: Item.first.id

    item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "75107.0", item[:unit_price]
  end

  test "#find_all" do
    get :find_all, format: :json, id: Item.first.id

    items = JSON.parse(response.body, symbolize_names: true)
    item  = items.last

    assert_response :success
    assert_equal 1,           items.count
    assert_equal "75107.0",   item[:unit_price]
  end

  test "#random" do
    get :random, format: :json

    merchant = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal Hash,  merchant.class
    assert_equal false, merchant.empty?
  end

  test "#invoice_items" do
    get :invoice_items, format: :json, id: Item.first.id

    invoice_items = JSON.parse(response.body, symbolize_names: true)
    invoice_item  = invoice_items.first

    assert_response :success
    assert_equal Array, invoice_items.class
  end

  test "#merchant" do
    get :merchant, format: :json, id: Item.first.id

    merchants = JSON.parse(response.body, symbolize_names: true)
    merchant  = merchants.first

    assert_response :success
    assert_equal Hash, merchants.class
  end
end
