class PagesController < ApplicationController
  

def index
	@recipes = Recipe.last(3)
end


end
