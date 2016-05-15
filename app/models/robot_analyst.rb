class RobotAnalyst
  attr_reader :robot_manager

  def initialize(robot_manager)
    @robot_manager = robot_manager
  end

  def collect_all_cities
    robots = robot_manager.all
    robots.map do |robot|
      {robot.city => 1}
    end
  end

  def group_by_city
    collect_all_cities.group_by do |hash|
      hash.keys[0]
    end
  end

  def robots_per_city
    group_by_city.map do |key, value|
      [key, value.count]
    end.to_h
  end

  



end
