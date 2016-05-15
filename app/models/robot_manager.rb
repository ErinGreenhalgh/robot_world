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
    locate_robot(id).to_a[0]
  end

  def all
    table.to_a.map { |data| Robot.new(data)}
  end

  def find(id)
    Robot.new(raw_robot(id))
  end

  def update(id, robot_data)
    locate_robot(id).update(robot_data)
  end

  def delete_all
    table.delete
  end

  def locate_robot(id)
    table.where(:id => id)
  end
end
