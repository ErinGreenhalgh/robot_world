require 'yaml/store'

class RobotWorldApp < Sinatra::Base

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
    redirect '/robots'
  end

  put '/robots/:name' do |name|
    @robot = robot_manager.update(params[:robot], name)
    redirect '/robots/:name'
  end

  get '/robots/:name' do |name|
    @robot = robot_manager.find(name)
    erb :show
  end

  def robot_manager
    database = YAML::Store.new('db/robot_world')
    @robot_manager ||=  RobotManager.new(database)
  end

end
