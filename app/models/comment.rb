class Comment < ActiveRecord::Base
  attr_accessible :body, :user_id, :recipe_id
  validates_presence_of :body, :maximun => { :length => 200 }
  validates_presence_of :user_id
  validates_presence_of :recipe_id
  belongs_to :user
  belongs_to :recipe
end
