class RobotManager

  attr_reader :database

  def initialize(database)
    @database = database
  end

  def table
    database.from(:robots).order(:id)
  end

  def create(robot)
    table.insert(robot)
  end

  def all
    table.to_a.map { |data| Robot.new(data) }
  end

  def find(id)
    Robot.new(raw_robot_data(id))
  end

  def raw_robot_data(id)
    locate(id).to_a.first
  end

  def update(id, robot)
    locate(id).update(robot)
  end

  def destroy(id)
    locate(id).delete
  end

  def delete_all
    table.delete
  end

  def locate(id)
    table.where(id: id)
  end

end
