require 'spec_helper'

feature 'has a search box', %q{
  the user navigates to the home page
  there is a search box to enter what recipe I want to search for
  so i can click on search and see my results
} do 

  # Acceptance criteria
  # - I can input data into a search box
  # - So i can click search

  let(:valid_user) { FactoryGirl.create(:user) }

  let(:valid_ingredients) do                     
    9.times do FactoryGirl.create(:ingredient) 
    end
  end
   
  let(:recipe) do 
    3.times do FactoryGirl.create(:recipe, :ingredients => valid_ingredients )
  end

  describe 'I can input data into a search box' do 

    it 'has a text to input search options' do

      sign_in_as valid_user

      recipe.each do |recipe|
        fill_in 'search-box', with: recipe
        click_on 'search-button'
        expect(page).to have_content(recipe.title[0])
        expect(page).to have_content(recipe.title[0])
        expect(page).to have_content(recipe.title[0])
        end
      end
    end
  end
end
