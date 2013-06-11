require 'spec_helper'

describe Recipe do
  describe "only add to database if criteria is accepted" do

  	it 'adds a new recipe when criteria is not invalid' do 
  	prev_count = Recipe.count
  	recipe = Recipe.new(:author => 'Chris', :title => 'Lasagna')
  	recipe.save
  	expect(Recipe.count).to eql(prev_count + 1)
  	end
  end
end
