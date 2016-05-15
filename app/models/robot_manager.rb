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
                              "city" => robot[:city],
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

  def find(id)
    all.find { |robot| robot.id == id }
  end

  def update(id, robot)
    database.transaction do
      target = database["robots"].find { |row| row["id"] == id }
      target["name"] = robot[:name]
      target["city"] = robot[:city]
      target["state"] = robot[:state]
      target["avatar"] = robot[:avatar]
      target["birthdate"] = robot[:birthdate]
      target["date_hired"] = robot[:date_hired]
      target["department"] = robot[:department]
    end
  end

  def destroy(id)
    database.transaction do
      database["robots"].delete_if { |robot| robot["id"] == id }
    end
  end

  def delete_all
    database.transaction do 
      database["robots"] = []
      database["total"] = 0
    end
  end
end
