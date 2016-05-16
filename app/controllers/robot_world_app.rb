class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get "/" do 
    @robot_stats ||= RobotStats.new(robot_manager)
    haml :dashboard 
  end

  get "/robots" do
    @robots = robot_manager.all
    haml :index
  end

  get "/robots/new" do
    haml :new
  end

  post "/robots" do
    robot_manager.create(params[:robot])
    redirect "/robots"
  end

  get "/robots/:id/edit" do |id|
    @robot = robot_manager.find(id.to_i)
    haml :edit
  end

  get "/robots/:id" do |id|
    @robot = robot_manager.find(id.to_i) 
    haml :show
  end

  put "/robots/:id" do |id|
    robot_manager.update(id.to_i, params[:robot])
    redirect "/robots/#{id}"
  end
  
  delete "/robots/:id" do |id|
    robot_manager.destroy(id.to_i)
    redirect "/robots"
  end
  
  def robot_manager
    if ENV["RACK_ENV"] == "test"
      database = Sequel.postgres("robot_manager_test")
    else
      database = Sequel.postgres("robot_manager")
    end
    @robot_manager ||= RobotManager.new(database)
  end

end
