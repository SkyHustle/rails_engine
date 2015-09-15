require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "#show" do
    get :show, format: :json, id: Item.first.id

    item = JSON.parse(response.body, symbolize_names: true)

    assert_response :success
    assert_equal "Item Autem Minima", item[:name]
    assert_equal "Cumque consequuntur ad. Fuga tenetur illo molestias enim aut iste. Provident quo hic aut. Aut quidem voluptates dolores. Dolorem quae ab alias tempora.",        item[:description]
    assert_equal "67076.0",               item[:unit_price]
    assert_equal 1,                   item[:merchant_id]
  end
end
