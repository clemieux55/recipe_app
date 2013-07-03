require 'spec_helper'

describe 'homepage content' do

  let(:valid_user) { FactoryGirl.create(:user) }

  let(:ingredient1) { FactoryGirl.create(:ingredient) }
  let(:ingredient2) { FactoryGirl.create(:ingredient) }
  let(:ingredient3) { FactoryGirl.create(:ingredient) }

  let!(:recipe1) { FactoryGirl.create(:recipe_with_ingredients, ingredients: [ingredient1, ingredient2, ingredient3]) }
  let!(:recipe2) { FactoryGirl.create(:recipe_with_ingredients, ingredients: [ingredient1, ingredient2, ingredient3]) }
  let!(:recipe3) { FactoryGirl.create(:recipe_with_ingredients, ingredients: [ingredient1, ingredient2, ingredient3]) }



  before :each do 
    visit root_path
    sign_in_as valid_user
  end

  it 'should have a recent recipe field' do
    expect(page).to have_content('Last Three Recipes')
  end

  it 'should have the last three recipes created' do
    expect(page).to have_content(recipe1.title)
    expect(page).to have_content(recipe2.title)
    expect(page).to have_content(recipe3.title)
  end

  it 'has the ingredients displayed for the recipe' do 
    recipe1.ingredients.each do |ingredient|
      expect(page).to have_content(ingredient.name)
    end
  end
end



