class RobotAnalyst
  attr_reader :robot_manager

  def initialize(robot_manager)
    @robot_manager = robot_manager
  end

  def group(information)
    information.group_by do |hash|
      hash.keys[0]
    end
  end

  def count_robots_per(information)
    information.map do |key, value|
      [key, value.count]
    end.to_h
  end

  def collect_all_cities
    robot_manager.all.map do |robot|
      {robot.city => 1}
    end
  end

  def group_by_city
    group(collect_all_cities)
  end

  def robots_per_city
    count_robots_per(group_by_city)
  end

  def collect_all_states
    robot_manager.all.map do |robot|
      {robot.state => 1}
    end
  end

  def group_by_state
    group(collect_all_states)
  end

  def robots_per_state
    count_robots_per(group_by_state)
  end

  def collect_all_departments
    robot_manager.all.map do |robot|
      {robot.department => 1}
    end
  end

  def group_by_department
    group(collect_all_departments)
  end

  def robots_per_department
    count_robots_per(group_by_department)
  end







end
