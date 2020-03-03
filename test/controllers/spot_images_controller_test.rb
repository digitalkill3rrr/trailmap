require 'test_helper'

class SpotImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spot_image = spot_images(:one)
  end

  test "should get index" do
    get spot_images_url
    assert_response :success
  end

  test "should get new" do
    get new_spot_image_url
    assert_response :success
  end

  test "should create spot_image" do
    assert_difference('SpotImage.count') do
      post spot_images_url, params: { spot_image: { image: @spot_image.image, spot_id: @spot_image.spot_id } }
    end

    assert_redirected_to spot_image_url(SpotImage.last)
  end

  test "should show spot_image" do
    get spot_image_url(@spot_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_spot_image_url(@spot_image)
    assert_response :success
  end

  test "should update spot_image" do
    patch spot_image_url(@spot_image), params: { spot_image: { image: @spot_image.image, spot_id: @spot_image.spot_id } }
    assert_redirected_to spot_image_url(@spot_image)
  end

  test "should destroy spot_image" do
    assert_difference('SpotImage.count', -1) do
      delete spot_image_url(@spot_image)
    end

    assert_redirected_to spot_images_url
  end
end
