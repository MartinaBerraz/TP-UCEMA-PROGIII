require 'test_helper'

class GuardarropasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get guardarropas_index_url
    assert_response :success
  end

end
