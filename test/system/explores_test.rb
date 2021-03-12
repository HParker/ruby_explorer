require "application_system_test_case"

class ExploresTest < ApplicationSystemTestCase
  setup do
    @explore = explores(:one)
  end

  test "visiting the index" do
    visit explores_url
    assert_selector "h1", text: "Explores"
  end

  test "creating a Explore" do
    visit explores_url
    click_on "New Explore"

    click_on "Create Explore"

    assert_text "Explore was successfully created"
    click_on "Back"
  end

  test "updating a Explore" do
    visit explores_url
    click_on "Edit", match: :first

    click_on "Update Explore"

    assert_text "Explore was successfully updated"
    click_on "Back"
  end

  test "destroying a Explore" do
    visit explores_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Explore was successfully destroyed"
  end
end
