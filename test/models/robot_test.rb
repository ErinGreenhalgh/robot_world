require_relative '../test_helper'

class RobotTest < Minitest::Test

  def test_it_can_assign_robot_attributes
    data =
    {
      "name" => "Henry",
      "city" => "Denver",
      "state" => "CO",
      "avatar" => "robot_url",
      "birthdate" => "05-12-1990",
      "date_hired" => "05-15-2015",
      "department" => "Human Resources"
    }
    r = Robot.new(data)
    assert_equal "Henry", r.name
    assert_equal "Denver", r.city
    assert_equal "CO", r.state
    assert_equal "robot_url", r.avatar
    assert_equal "05-12-1990", r.birthdate
    assert_equal "05-15-2015", r.date_hired
    assert_equal "Human Resources", r.department
  end

end
