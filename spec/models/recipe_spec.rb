require 'spec_helper'

describe Recipe do
  describe "only add to database if criteria is accepted" do


    it { should have_valid(:title).when('Mothers Lasagna', 'Applesauce') }
    it { should_not have_valid(:title).when('', nil) }

    it { should have_valid(:description).when('This is one delishish meal!') }
    it { should_not have_valid(:description).when('', nil) }

    it { should have_valid(:author).when('Joe Montanta', 'Chris Lemieux') }
    it { should have_valid(:author).when('', nil) }


    it { should have_many(:recipe_ingredients) }
    it { should have_many(:ingredients) } 

    it { should have_many(:comments) }
  end
end
