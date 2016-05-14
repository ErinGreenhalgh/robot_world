require './test/test_helper'

class UserCanCreateANewRobotTest < FeatureTest
  def test_user_can_create_a_new_robot
    visit '/'
    click_link "Create a New Robot"

    assert_equal '/robots/new', current_path

    fill_in 'robot[name]', with: "Henrietta"
    fill_in 'robot[city]', with: "Denver"
    fill_in 'robot[state]', with: "CO"
    fill_in 'robot[avatar]', with: "www.thing.com"
    fill_in 'robot[birthdate]', with: "05-23-1987"
    fill_in 'robot[date_hired]', with: "04-16-1993"
    fill_in 'robot[department]', with: "PR"

    click_button 'Create Robot'

    assert_equal '/robots', current_path

    assert page.has_content?("Henrietta")

  end
end
