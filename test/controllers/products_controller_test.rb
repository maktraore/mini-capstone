require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get new_page" do
    get products_new_page_url
    assert_response :success
  end

end
