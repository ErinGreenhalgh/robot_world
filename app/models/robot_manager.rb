require 'yaml/store'

class RobotManager
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def raw_robots
    database.transaction do
      database["robots"] || []
    end
  end

  def raw_robot(name)
    raw_robots.find {|robot| robot['name'] == name}
  end

  def all
    raw_robots.map { |robot_data| Robot.new(robot_data)}
  end

  def create(robot_data)
    database.transaction do
      database['robots'] ||= []
      database['robots'] << {"name" => robot_data[:name],
                             "city" => robot_data[:city],
                             "state" => robot_data[:state],
                             "avatar" => robot_data[:avatar],
                             "birthdate" => robot_data[:birthdate],
                             "date_hired" => robot_data[:date_hired],
                             "department" => robot_data[:department],
                            }
    end
  end

  def find(name)
    Robot.new(raw_robot(name))
  end

  def delete_all
    database.transaction do
      database['robots'] = []
    end
  end
end
