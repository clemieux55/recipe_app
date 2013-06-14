require 'spec_helper'

describe Recipe do
  describe "only add to database if criteria is accepted" do

  	it 'adds a new recipe when criteria is valid' do 
  	prev_count = Recipe.count
  	FactoryGirl.create(:recipe)
  	expect(Recipe.count).to eql(prev_count + 1)
  	end
  end
end
