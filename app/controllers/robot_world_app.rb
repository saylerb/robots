require "yaml/store"
require "models/robot_manager"

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get "/" do 
    haml :dashboard 
  end

  get "/robots" do
    @robots = ["robot1", "robot2", "robot3"]
    haml :index
  end

  get "/robots/new" do
    haml :new
  end

  post "/robots" do
    robot_manager.create(params[:robot])
    redirect "/tasks"
  end

  def robot_manager
    database = YAML::Store.new("db/robot_manager")
    @robot_manager ||= RobotManager.new(database)
  end



end
