require 'mongo_mapper'

MongoMapper.connection = Mongo::Connection.new(ENV['mongo_db_host'] || 'localhost')
MongoMapper.database = ENV['mongo_db'] || 'prey_standalone_control_panel'

class Device
  include MongoMapper::Document

  key :name, String, :required => true
  key :missing, Boolean, :default => false
  key :delay, Integer, :default => 20, :in => 2..59
  key :module_list, String, :default => 'geo network session webcam'

end
