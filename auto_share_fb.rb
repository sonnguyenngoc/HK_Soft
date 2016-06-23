require 'active_record'
require 'action_view'
require 'yaml'
require 'koala'
DIR = File.expand_path(File.dirname(__FILE__))

# Change the following to reflect your database settings
# config = YAML.load_file(DIR+'/config/database.yml')["production"]
config = YAML.load_file(DIR+'/config/database.yml')["development"]

puts DIR+'/config/database.yml'

ActiveRecord::Base.establish_connection(
  adapter: config["adapter"],
  encoding: config["encoding"],
  database: config["database"],
  pool: 5,
  username: config["username"],
  password: config["password"]
)

#Item class
require DIR+'/app/models/product.rb'
require DIR+'/app/models/code_status.rb'

class Article < ActiveRecord::Base
  belongs_to :code_status
  
  def self.get_facebook_share_message
    records = self.joins(:code_status).where("code_statuses.title = 'facebook_share_message' and articles.approved = true")
    records = records.order("created_at").first
    
    return records
  end
end

class ProductImage < ActiveRecord::Base

end

# System.backup({database: true, file: true, dir: DIR+"/"})
Product.share_facebook








