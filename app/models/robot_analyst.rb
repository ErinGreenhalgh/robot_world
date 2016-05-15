class RobotAnalyst
  attr_reader :robot_manager

  def initialize(robot_manager)
    @robot_manager = robot_manager
  end

  def collect_all_cities
    robot_manager.all.map do |robot|
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

  def collect_all_states
    robot_manager.all.map do |robot|
      {robot.state => 1}
    end
  end

  def group_by_state
    collect_all_states.group_by do |hash|
      hash.keys[0]
    end
  end

  def robots_per_state
    group_by_state.map do |key, value|
      [key, value.count]
    end.to_h
  end







end
