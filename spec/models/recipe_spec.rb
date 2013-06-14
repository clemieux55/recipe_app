require 'spec_helper'

describe Recipe do
  describe "only add to database if criteria is accepted" do

  	it 'adds a new recipe when criteria is valid' do 
	  	prev_count = Recipe.count
	  	FactoryGirl.create(:recipe)
	  	expect(Recipe.count).to eql(prev_count + 1)
  	end

  	it 'will not add a recipe if title is invalid' do 
  		prev_count = Recipe.count
  		recipe = FactoryGirl.build(:recipe, :title => '')
  		expect(Recipe.count).to eql(prev_count )
  	end
  end
end
