require "application_system_test_case"

class SpotImagesTest < ApplicationSystemTestCase
  setup do
    @spot_image = spot_images(:one)
  end

  test "visiting the index" do
    visit spot_images_url
    assert_selector "h1", text: "Spot Images"
  end

  test "creating a Spot image" do
    visit spot_images_url
    click_on "New Spot Image"

    fill_in "Image", with: @spot_image.image
    fill_in "Spot", with: @spot_image.spot_id
    click_on "Create Spot image"

    assert_text "Spot image was successfully created"
    click_on "Back"
  end

  test "updating a Spot image" do
    visit spot_images_url
    click_on "Edit", match: :first

    fill_in "Image", with: @spot_image.image
    fill_in "Spot", with: @spot_image.spot_id
    click_on "Update Spot image"

    assert_text "Spot image was successfully updated"
    click_on "Back"
  end

  test "destroying a Spot image" do
    visit spot_images_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Spot image was successfully destroyed"
  end
end
