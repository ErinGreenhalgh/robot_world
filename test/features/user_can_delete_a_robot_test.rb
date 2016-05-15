require './test/test_helper'

class UserCanDeleteARobotTest < FeatureTest
  def test_user_can_delete_a_robot
    data =
    {
      name: "Henry",
      city: "Denver",
      state: "CO",
      avatar: "https://robohash.org/guy",
      birthdate: "05-12-2000",
      date_hired: "05-12-2015",
      department: "accounting"
    }

    id = robot_manager.create(data)
    visit "/robots"
    assert page.has_content?("Henry")
    click_button "Delete"
    robot_manager.destroy(id)
    assert '/robots', current_path
    refute page.has_content?("Henry")
  end
end
