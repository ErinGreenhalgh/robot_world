require 'yaml/store'

class RobotManager
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(robot_data)
    database.transaction do
      database['robots'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['robots'] << {"id" => database['total'],
                             "name" => robot_data[:name],
                             "city" => robot_data[:city],
                             "state" => robot_data[:state],
                             "avatar" => robot_data[:avatar],
                             "birthdate" => robot_data[:birthdate],
                             "date_hired" => robot_data[:date_hired],
                             "department" => robot_data[:department],
                            }
    end
  end

  def raw_robots
    database.transaction do
      database["robots"] || []
    end
  end

  def raw_robot(name)
    raw_robots.find {|robot| robot["name"] == name}
  end

  def all
    raw_robots.map { |robot_data| Robot.new(robot_data)}
  end

  def find(name)
    Robot.new(raw_robot(name))
  end

  def update(id, robot_data)
    database.transaction do
      target_robot = database['robots'].find { |data| data["name"] == name }
      target_robot["name"] = robot_data[:name]
      target_robot["city"] = robot_data[:city]
      target_robot["state"] = robot_data[:state]
      target_robot["avatar"] = robot_data[:avatar]
      target_robot["birthdate"] = robot_data[:birthdate]
      target_robot["date_hired"] = robot_data[:date_hired]
      target_robot["department"] = robot_data[:department]
    end
  end

  def delete_all
    database.transaction do
      database['robots'] = []
      database['total'] = 0
    end
  end
end
