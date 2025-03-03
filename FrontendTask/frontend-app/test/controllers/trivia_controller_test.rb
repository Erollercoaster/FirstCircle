require "test_helper"

class TriviaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trivia_index_url
    assert_response :success
  end
end
