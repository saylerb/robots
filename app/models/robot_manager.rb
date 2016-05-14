class RobotManager

  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(robot)
    database.transaction do 
      database["robots"] ||= []
      database["total"] ||= 0
      database["total"] += 1
      database["robots"] << { "id" => database["total"],
                              "name" => robot[:name], 
                              "state" => robot[:state], 
                              "avatar" => robot[:avatar], 
                              "birthdate" => robot[:birthdate],
                              "date_hired" => robot[:date_hired],
                              "department" => robot[:department] }
    end
  end

  def raw_tasks
    database.transaction do
      database["robots"] || []
    end
  end

  def all
    raw_tasks.map { |robot| Robot.new(robot) }
  end

end
