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

  delete '/robots/:id' do |id|
    robot_manager.destroy(id)
    redirect '/robots'
  end

  get '/robots/:id' do |id|
    @robot = robot_manager.find(id)
    erb :show
  end

  get '/robots/:id/edit' do |id|
    @robot = robot_manager.find(id)
    erb :edit
  end

  put '/robots/:id' do |id|
    @robot = robot_manager.update(params[:robot], id)
    redirect "/robots/#{id}"
  end

  def robot_manager
    if ENV['RACK_ENV'] == 'test'
      database = Sequel.postgres('robot_manager_test')
    else
      database = Sequel.postgres('robot_manager')
    end
    @robot_manager ||=  RobotManager.new(database)
  end

end
