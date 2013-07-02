require 'spec_helper'

describe 'homepage content' do
  let(:valid_user) { FactoryGirl.create(:user) }
  let(:ingredient1) { FactoryGirl.create(:ingredient) }
  let(:ingredient2) { FactoryGirl.create(:ingredient) }
  let(:ingredient3) { FactoryGirl.create(:ingredient) }

  let!(:recipe1) { FactoryGirl.create(:recipe_with_ingredients, ingredients: [ingredient2, ingredient1, ingredient3]) }
  let!(:recipe2) { FactoryGirl.create(:recipe_with_ingredients, ingredients: [ingredient2, ingredient1, ingredient3]) }
  let!(:recipe3) { FactoryGirl.create(:recipe_with_ingredients, ingredients: [ingredient2, ingredient1, ingredient3]) }

  before :each do 
    visit root_path
    sign_in_as valid_user
  end


  it 'should have a recent recipe field' do
    expect(page).to have_content('Last Three Recipes Added')
  end

  it 'should have the last three recipe titles created displayed' do 
    expect(page).to have_content(recipe1.title, recipe2.title, recipe3.title)
  end

  it 'should have the descriptions displayed for the recipe' do 
    expect(page).to have_content(recipe1.description, recipe2.description, recipe3.description)
  end

  it 'should have the ingredients for recipe displayed' do 
    recipe1.ingredients.each do |ingredient|
      expect(page).to have_content(ingredient.name)
    end
  end
end



