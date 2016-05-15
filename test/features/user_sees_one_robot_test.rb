require './test/test_helper'

class UserSeesOneRobotTest < FeatureTest

  def test_user_sees_one_robot
    data = {
        name: "Henry",
        city: "Denver",
        state: "CO",
        avatar: "https://robohash.org/henry",
        birthdate: "05-12-2000",
        date_hired: "05-12-2015",
        department: "accounting"
    }

    robot_id = robot_manager.create(data)
    robot = robot_manager.find(robot_id)

    visit '/'
    click_link 'Robot Index'
    assert page.has_content?("Henry")

    click_link 'Henry'
    assert_equal "/robots/#{robot_id}", current_path

    assert page.has_content?("Henry")
    assert page.has_content?("Denver")
    assert page.has_content?("CO")
    assert page.has_content?("https://robohash.org/henry")
    assert page.has_content?("05-12-2000")
    assert page.has_content?("05-12-2015")
    assert page.has_content?("accounting")
  end
  
end
