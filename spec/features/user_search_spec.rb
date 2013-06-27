require 'spec_helper'

describe 'searching recipes' do

  let(:valid_user) { FactoryGirl.create(:user) }
    let(:valid_ingredients) do                     
      FactoryGirl.create(:ingredient) do |ingredient|
        valid_ingredients << ingredient.create(:name => 'Noodle')
        valid_ingredients << ingredient.create(:name => 'Butter')
        valid_ingredients << ingredient.create(:name => 'peanuts')
      end
    end
    
    binding.pry

   let(:recipe) do 
    FactoryGirl.create(:recipe) do |recipe|

    end
  end

  before :each do
    visit root_path
    sign_in_as valid_user
  end 

  it 'allows the user to input what they would like to search for' do 
    fill_in 'search-field', :with => 'lasagna'
    click_on 'search-button'
    expect(page).to have_content("Mothers Lasagna")
  end

  it 'checks to see if search brings you to the correct path' do
    fill_in 'search-field', :with => 'lasagna'
    click_on 'search-button'
    expect(current_path).to eql(recipes_path)
  end
end

