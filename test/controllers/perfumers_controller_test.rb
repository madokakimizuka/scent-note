require 'test_helper'

class PerfumersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get perfumers_index_url
    assert_response :success
  end

end
