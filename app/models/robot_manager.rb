require 'yaml/store'
require 'models/robot'

class RobotManager

  def initialize(database)
    @database = database
  end

  def raw_robots
    @database.transaction do
      @database["robots"] || []
    end
  end

  def all
    raw_robots.map { |robot_data| Robot.new(robot_data)}
  end
end
