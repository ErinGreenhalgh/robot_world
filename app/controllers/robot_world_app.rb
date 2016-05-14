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

  put '/robots/:id' do |id|
    @robot = robot_manager.update(params[:robot], id)
    redirect '/robots/:name'
  end

  get '/robots/:id' do |id|
    @robot = robot_manager.find(id)
    erb :show
  end

  def robot_manager
    database = Sequel.postgres('robot_manager')
    @robot_manager ||=  RobotManager.new(database)
  end

end
