ENV["RACK_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)

require "minitest/autorun"
require "minitest/emoji"
require "tilt/erb"

module TestHelpers

  def setup
    robot_manager.create({ :name => "Bender",
                           :city => "Denver",
                           :state => "Colorado",
                           :avatar => nil,
                           :birthdate => "11/18/1990",
                           :date_hired => "11/18/1990",
                           :department => "Engineering" })

    robot_manager.create({ :name => "Fender",
                           :city => "Denver",
                           :state => "Colorado",
                           :avatar => nil,
                           :birthdate => "10/09/1986",
                           :date_hired => "10/09/1986",
                           :department => "Law" })
  end

  def teardown
    robot_manager.delete_all
    super
  end

  def robot_manager
    database = YAML::Store.new("db/robot_manager_test")
    @robot_manager ||= RobotManager.new(database)
  end
end


