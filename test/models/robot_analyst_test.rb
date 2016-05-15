require './test/test_helper'

class RobotAnalystTest < Minitest::Test
  include TestHelper

  def setup
    data1 =
    {
      name: "Henry",
      city: "Denver",
      state: "CO",
      department: "IT"
    }

    data2=
    {
      name: "Henrietta",
      city: "Tucson",
      state: "AZ",
      department: "HR"
    }

    data3=
    {
      name: "Pheobe",
      city: "Tucson",
      state: "AZ",
      department: "IT"
    }

    robot_manager.create(data1)
    robot_manager.create(data2)
    robot_manager.create(data3)

    @ra = RobotAnalyst.new(robot_manager)
  end

  def test_it_can_collect_all_the_cities
    collected = [{"Denver"=>1}, {"Tucson"=>1}, {"Tucson"=>1}]
    assert_equal collected, @ra.collect_all_cities
  end

  def test_it_can_group_by_city
    grouped =
    {
      "Denver" => [{"Denver" => 1}],
      "Tucson" => [{"Tucson" => 1}, {"Tucson" => 1}]
    }
    assert_equal grouped, @ra.group_by_city
  end

  def test_it_can_give_robots_per_city
    city_data =
    {
      "Denver" => 1,
      "Tucson" => 2
    }
    assert_equal city_data, @ra.robots_per_city
  end

  def test_it_can_collect_all_states
    collected = [{"CO"=>1}, {"AZ"=>1}, {"AZ"=>1}]
    assert_equal collected, @ra.collect_all_states
  end

  def test_it_can_group_all_states
    grouped =
    {
      "CO" => [{"CO" => 1}],
      "AZ" => [{"AZ" => 1}, {"AZ" => 1}]
    }
    assert_equal grouped, @ra.group_by_state
  end

  def test_it_can_give_robots_per_state
    state_data =
    {
      "CO" => 1,
      "AZ" => 2
    }
    assert_equal state_data, @ra.robots_per_state
  end

end
