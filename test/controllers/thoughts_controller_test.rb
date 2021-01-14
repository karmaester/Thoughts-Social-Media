require 'test_helper'

class ThoughtsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @thought = thoughts(:one)
  end

  test "should get index" do
    get thoughts_url
    assert_response :success
  end

  test "should get new" do
    get new_thought_url
    assert_response :success
  end

  test "should create thought" do
    assert_difference('Thought.count') do
      post thoughts_url, params: { thought: { thought: @thought.thought } }
    end

    assert_redirected_to thought_url(Thought.last)
  end

  test "should show thought" do
    get thought_url(@thought)
    assert_response :success
  end

  test "should get edit" do
    get edit_thought_url(@thought)
    assert_response :success
  end

  test "should update thought" do
    patch thought_url(@thought), params: { thought: { thought: @thought.thought } }
    assert_redirected_to thought_url(@thought)
  end

  test "should destroy thought" do
    assert_difference('Thought.count', -1) do
      delete thought_url(@thought)
    end

    assert_redirected_to thoughts_url
  end
end
