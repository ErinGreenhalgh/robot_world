require "models/robot_manager"
require "models/robot"

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get "/" do
    erb :dashboard
  end

  get "/robots" do
    @robots = robot_manager.all
    erb :index
  end

  get "/robots/new" do
    erb :new
  end

  post "/robots" do
    robot_manager.create(params[:robot])
    redirect '/tasks'
  end

  def robot_manager
    database = YAML::Store.new('db/robot_world')
    @robot_manager ||=   RobotManager.new(database)
  end




end
