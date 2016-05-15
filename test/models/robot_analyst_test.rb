require './test/test_helper'

class RobotAnalystTest < Minitest::Test
  include TestHelper

  def test_it_can_collect_all_the_cities
    data1 =
    {
      name: "Henry",
      city: "Denver",
      state: "CO",
    }

    data2=
    {
      name: "Henrietta",
      city: "Tucson",
      state: "AZ",
    }

    data3=
    {
      name: "Pheobe",
      city: "Tucson",
      state: "AZ",
    }

    robot_manager.create(data1)
    robot_manager.create(data2)
    robot_manager.create(data3)

    ra = RobotAnalyst.new(robot_manager)
    collected = [{"Denver"=>1}, {"Tucson"=>1}, {"Tucson"=>1}]
    assert_equal collected, ra.collect_all_cities
  end

  def test_it_can_group_by_city
    data1 =
    {
      name: "Henry",
      city: "Denver",
      state: "CO",
    }

    data2=
    {
      name: "Henrietta",
      city: "Tucson",
      state: "AZ",
    }

    data3=
    {
      name: "Pheobe",
      city: "Tucson",
      state: "AZ",
    }

    robot_manager.create(data1)
    robot_manager.create(data2)
    robot_manager.create(data3)

    ra = RobotAnalyst.new(robot_manager)
    grouped =
    {
      "Denver" => [{"Denver" => 1}],
      "Tucson" => [{"Tucson" => 1}, {"Tucson" => 1}]
    }
    assert_equal grouped, ra.group_by_city
  end

  def test_it_can_give_robots_per_city
    data1 =
    {
      name: "Henry",
      city: "Denver",
      state: "CO",
    }

    data2=
    {
      name: "Henrietta",
      city: "Tucson",
      state: "AZ",
    }

    data3=
    {
      name: "Pheobe",
      city: "Tucson",
      state: "AZ",
    }

    robot_manager.create(data1)
    robot_manager.create(data2)
    robot_manager.create(data3)

    city_data =
    {
      "Denver" => 1,
      "Tucson" => 2
    }
    ra = RobotAnalyst.new(robot_manager)
    assert_equal city_data, ra.robots_per_city
  end

end
