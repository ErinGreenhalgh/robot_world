require 'bundler'
Bundler.require

databases = [Sequel.postgres("robot_manager"),
             Sequel.postgres("robot_manager_test")]

databases.each do |database|
  database.create_table :robots do
    primary_key :id
    String :name, :size => 255
    String :city, :size => 50
    String :state, :size => 50
    String :avatar, :size => 255
    String :birthdate, :size => 50
    String :date_hired, :size => 50
    String :department, :size => 255
  end
end 
