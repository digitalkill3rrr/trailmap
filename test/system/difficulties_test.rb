require "application_system_test_case"

class DifficultiesTest < ApplicationSystemTestCase
  setup do
    @difficulty = difficulties(:one)
  end

  test "visiting the index" do
    visit difficulties_url
    assert_selector "h1", text: "Difficulties"
  end

  test "creating a Difficulty" do
    visit difficulties_url
    click_on "New Difficulty"

    fill_in "Level", with: @difficulty.level
    click_on "Create Difficulty"

    assert_text "Difficulty was successfully created"
    click_on "Back"
  end

  test "updating a Difficulty" do
    visit difficulties_url
    click_on "Edit", match: :first

    fill_in "Level", with: @difficulty.level
    click_on "Update Difficulty"

    assert_text "Difficulty was successfully updated"
    click_on "Back"
  end

  test "destroying a Difficulty" do
    visit difficulties_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Difficulty was successfully destroyed"
  end
end
