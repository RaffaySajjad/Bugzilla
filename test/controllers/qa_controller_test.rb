require 'test_helper'

class QaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get qa_index_url
    assert_response :success
  end

end
