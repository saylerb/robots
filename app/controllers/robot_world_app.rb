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

end
