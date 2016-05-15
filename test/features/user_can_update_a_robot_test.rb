require "./test/test_helper"

class UserCanUpdateARobotTest < FeatureTest

  def test_user_can_update_a_robot
    data =
    {
        name: "Henry",
        city: "Denver",
        state: "CO",
        avatar: "https://robohash.org/henry",
        birthdate: "05-12-2000",
        date_hired: "05-12-2015",
        department: "accounting"
    }
    id = robot_manager.create(data)
    robot = robot_manager.find(id)
    visit '/robots'
    assert page.has_content?("Henry")
# save_and_open_page

    click_link "Edit"
    assert_equal "/robots/#{id}/edit", current_path
    assert page.has_content?("")
    fill_in "robot[name]", with: "Henrietta"
    fill_in "robot[city]", with: "Tucson"
    click_button "Submit Updates"
    assert_equal "/robots/#{id}", current_path
    assert page.has_content?("Henrietta")
    assert page.has_content?("Tucson")

  end

end
