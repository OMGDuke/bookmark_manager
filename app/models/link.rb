require 'data_mapper'
require 'dm-postgres-adapter'

class Link

  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :url, String

end

DataMapper.setup(:default, "postgres://zwnsiosliuuktd:T3wLqerzZsCbL_OW5ox7os4d0m@ec2-107-20-174-127.compute-1.amazonaws.com:5432/d7rgf9kaiknp5q" || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
