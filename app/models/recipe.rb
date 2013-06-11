class Recipe < ActiveRecord::Base
  attr_accessible :author, :title
  validates_presence_of :author, :title

end
