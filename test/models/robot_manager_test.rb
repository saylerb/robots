require_relative "../test_helper"

class TaskManagerTest < Minitest::Test
  include TestHelpers
  # must change Test Helper setup method when converting to Sequel
  # e.g. robot_id_1 = robot_manager.create({ :name => "Bender"...

  def test_it_creates_a_robot
    robot = robot_manager.find(1)
    assert_equal "Bender", robot.name
    assert_equal "Denver", robot.city
    assert_equal "Colorado", robot.state
    assert_equal 1, robot.id
  end

  def test_it_can_return_all_robots
    all_robots = robot_manager.all

    assert 2, all_robots.length
    assert_kind_of Robot, all_robots[0]
    assert_equal "Bender", robot_manager.find(1).name
    assert_equal "Engineering", robot_manager.find(1).department

    assert_kind_of Robot, all_robots[1]
    assert_equal "Fender", robot_manager.find(2).name
    assert_equal "Law", robot_manager.find(2).department
  end

  def test_it_can_find_a_single_robot
    robot = robot_manager.find(2)

    assert "Fender", robot.name
    assert "Law", robot.department
  end

  def test_it_can_update_a_single_robot
    robot_id = 2

    robot_manager.update(robot_id, {:name => "Mender",
                                    :city => "Denver",
                                    :state => "Colorado",
                                    :avatar => nil,
                                    :birthdate => "10/09/1986",
                                    :date_hired => "10/09/1986",
                                    :department => "Legal" })
                                    
    robot = robot_manager.find(robot_id)

    assert_equal "Mender", robot.name
    assert_equal "Denver", robot.city
    assert_equal "Legal", robot.department
  end

  def test_if_can_destroy_a_single_robot
    robot = robot_manager.find(2)
    assert_equal 2, robot_manager.all.length
    robot_manager.destroy(1)
    assert_equal 1, robot_manager.all.length
    refute robot_manager.find(1)
    assert_equal "Fender", robot.name
  end

end

