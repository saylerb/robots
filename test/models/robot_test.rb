require_relative "../test_helper"

class RobotTest < Minitest::Test
  def test_assigns_attributes_correctly

    robot = Robot.new( { "name" => "Bender",
                         "city" => "Denver",
                         "state" => "Colorado",
                         "avatar" => nil,
                         "birthdate" => "11/18/1990",
                         "date_hired" => "11/18/1990",
                         "department" => "Engineering" })

    assert_equal "Bender", robot.name
    assert_equal "Denver", robot.city
  end
end 
