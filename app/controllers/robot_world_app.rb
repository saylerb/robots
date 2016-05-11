class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get "/" do 
    "Hello, World"
  end

  get "/robots" do
    haml :dashboard 
  end
end
