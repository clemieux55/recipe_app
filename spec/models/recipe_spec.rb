require 'spec_helper'

describe Recipe do
  describe "only add to database if criteria is accepted" do


    it { should have_valid(:title).when('Mothers Lasagna', 'Applesauce') }
    it { should_not have_valid(:title).when('', nil) }

    it { should have_valid(:description).when('This is one delishish meal!') }
    it { should_not have_valid(:description).when('', nil) }

    it { should have_many(:recipe_ingredients) }
    it { should have_many(:ingredients) } 

    it { should have_many(:comments) }
    it { should belong_to(:user) }

    it { should validate_presence_of(:user) }
    it { should_not allow_mass_assignment_of(:user) }
  end
end
