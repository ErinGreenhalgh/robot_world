require './test/test_helper'

class UserSeesAllRobotsTest < FeatureTest
  def test_user_sees_all_robots
    robot1 = {
        name: "Henry",
        city: "Denver",
        state: "CO",
        avatar: "https://robohash.org/henry",
        birthdate: "05-12-2000",
        date_hired: "05-12-2015",
        department: "accounting"
    }

    robot2 = {
      name: "Gary",
      city: "Stockholm",
      state: "AZ",
      avatar: "https://robohash.org/gary",
      birthdate: "05-16-2015",
      date_hired: "05-17-2015",
      department: "party central"
    }

    robot_id1 = robot_manager.create(robot1)
    robot_id2 = robot_manager.create(robot2)

    visit '/robots'

    assert page.has_content?("Henry")
    assert page.has_content?("Gary")
  end
  
end
