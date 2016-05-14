require 'yaml/store'

class RobotManager
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def table
    database.from(:robots).order(:id)
  end

  def create(robot_data)
    table.insert(
      name: robot_data[:name],
      city: robot_data[:city],
      state: robot_data[:state],
      avatar: robot_data[:avatar],
      birthdate: robot_data[:birthdate],
      date_hired: robot_data[:date_hired],
      department: robot_data[:department]
    )
  end

  def raw_robot(id)
    table.where(:id => id).to_a[0]
  end

  def all
    table.to_a.map { |data| Robot.new(data)}
    # require "pry"; binding.pry
  end

  def find(id)
    Robot.new(raw_robot(id))
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
    table.delete
  end
end
