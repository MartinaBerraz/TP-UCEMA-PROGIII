require 'test_helper'

class AtuendosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get atuendos_index_url
    assert_response :success
  end

end
