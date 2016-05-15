require_relative '../test_helper'

class RobotManagerTest < Minitest::Test
  include TestHelper

  def test_it_can_create_a_new_robot
    data = {
      name: "Henry",
      city: "Denver",
      state: "CO",
      avatar: "https://robohash.org/guy",
      birthdate: "05-12-2000",
      date_hired: "05-12-2015",
      department: "accounting"
    }
    robot_id = robot_manager.create(data)
    robot = robot_manager.find(robot_id)
    assert_equal "Henry", robot.name
    assert_equal "Denver", robot.city
    assert_equal "CO", robot.state
    assert_equal "https://robohash.org/guy", robot.avatar
    assert_equal "05-12-2000", robot.birthdate
    assert_equal "05-12-2015", robot.date_hired
    assert_equal "accounting", robot.department

  end

  def test_it_can_find_all_robots
    robot_manager.create({name: "Henry", city: "Denver"})
    robot_manager.create({name: "Harry", city: "Stockholm"})

    robots = robot_manager.all
    assert_equal 2, robots.count
    assert_equal "Henry", robots.first.name
  end

  def test_it_can_find_a_specific_robot
    robot_id = robot_manager.create({name: "Henry", city: "Denver"})
    r = robot_manager.find(robot_id)
    assert_equal "Henry", r.name
    assert_equal robot_id, r.id
    assert_equal Robot, r.class
  end

  def test_it_can_update_a_robot
    data = {
      name: "Henry",
      city: "Denver",
      state: "CO",
      avatar: "https://robohash.org/guy",
      birthdate: "05-12-2000",
      date_hired: "05-12-2015",
      department: "accounting"
    }

    updated_data = {
      name: "Henrietta",
      city: "Tuscon",
      state: "AZ",
      avatar: "https://robohash.org/guy",
      birthdate: "05-12-2000",
      date_hired: "05-12-2015",
      department: "accounting"
    }
    id = robot_manager.create(data)
    robot = robot_manager.find(id)
    assert_equal "Henry", robot.name
    assert_equal "Denver", robot.city
    assert_equal "CO", robot.state
    robot_manager.update(id,updated_data)
    updated_robot = robot_manager.find(id)
    assert_equal "Henrietta", updated_robot.name
    assert_equal "Tuscon", updated_robot.city
    assert_equal "AZ", updated_robot.state
  end

end
