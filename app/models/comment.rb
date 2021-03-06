class Comment < ActiveRecord::Base
  attr_accessible :body, :user_id, :recipe_id
  validates_presence_of :body, :maximum => { :length => 200 }
  belongs_to :recipe
  belongs_to :user


end
