class Startup < ActiveRecord::Base
  attr_accessible :angelListID, :high_concept, :logo_url, :name, :product_desc, :thumb_url

  has_many :investments, :dependent => :destroy
  has_many :users, :through => :investments
end
