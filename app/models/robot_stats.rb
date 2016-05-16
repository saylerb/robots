class RobotStats
  def initialize(robot_manager)
    @robot_manager = robot_manager
    @all_robots = robot_manager.all
  end


  def average_age
    ages = @all_robots.map do |robot|
      ((Date.today - Date.strptime(robot.birthdate, "%m/%d/%Y"))/365).to_i
    end
    ages.reduce(:+)/@all_robots.length
  end

  def get_years
    @all_robots.each_with_object(Hash.new(0)) do |robot, count|
      count[Date.strptime(robot.birthdate, "%m/%d/%Y").year] += 1 
    end
  end

  def get_states
    @all_robots.each_with_object(Hash.new(0)) do |robot, count|
      count[robot.state] += 1 
    end
  end

  def get_departments
    @all_robots.each_with_object(Hash.new(0)) do |robot, count|
      count[robot.department] += 1 
    end
  end

  def get_cities
    @all_robots.each_with_object(Hash.new(0)) do |robot, count|
      count[robot.city] += 1 
    end
  end


end


