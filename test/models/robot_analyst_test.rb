require './test/test_helper'

class RobotAnalystTest < Minitest::Test
  include TestHelper

  def setup
    data1 =
    {
      name: "Henry",
      city: "Denver",
      state: "CO",
      department: "IT",
      date_hired: "05-14-2015",
      birthdate: "05-14-1976"
    }

    data2=
    {
      name: "Henrietta",
      city: "Tucson",
      state: "AZ",
      department: "HR",
      date_hired: "01-13-1992",
      birthdate: "01-13-1989"
    }

    data3=
    {
      name: "Pheobe",
      city: "Tucson",
      state: "AZ",
      department: "IT",
      date_hired: "12-13-2015",
      birthdate: "12-13-2000"
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

  def test_it_can_collect_all_departments
    collected = [{"IT"=>1}, {"HR"=>1}, {"IT"=>1}]
    assert_equal collected, @ra.collect_all_departments
  end

  def test_it_can_group_all_departments
    grouped =
    {
      "HR" => [{"HR" => 1}],
      "IT" => [{"IT" => 1}, {"IT" => 1}]
    }
    assert_equal grouped, @ra.group_by_department
  end

  def test_it_can_give_robots_per_department
    state_data =
    {
      "HR" => 1,
      "IT" => 2
    }
    assert_equal state_data, @ra.robots_per_department
  end

  def test_it_can_collect_all_years_hired
    collected = [{"2015"=>1}, {"1992"=>1}, {"2015"=>1}]
    assert_equal collected, @ra.collect_all_years_hired
  end

  def test_it_can_group_by_year_hired
    grouped =
    {
      "1992" => [{"1992" => 1}],
      "2015" => [{"2015" => 1}, {"2015" => 1}]
    }
    assert_equal grouped, @ra.group_by_year_hired
  end

  def test_it_can_give_robots_per_year_hired
    year_data =
    {
      "1992" => 1,
      "2015" => 2
    }
    assert_equal year_data, @ra.robots_hired_per_year
  end

  def test_it_can_convert_strings_to_date_objects
    assert_equal Date, @ra.convert_birthdate_to_date_object.first.class
  end

  def test_it_can_find_the_age_of_each_robot
    # skip
    assert_equal [1, 2], @ra.find_all_ages
  end



end
