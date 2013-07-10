require 'spec_helper'

describe 'Yummly' do 
	VCR.use_cassette('spec/cassettes') do 
		let!(:yummly) { Yummly.new('lasagna') }
	end

	it 'sends a request to the yummly api and returns a hash' do 
			expect(yummly).to_not be_nil
			expect(yummly).to be_kind_of(Yummly)
		end

	describe '.parse' do
		it 'extracts the recipes' do
			VCR.use_cassette('spec/cassettes') do
				recipes = yummly.recipes
				pesto = recipes.find { |recipe| recipe[:name] == 'Slow Cooker Pesto Spinach Lasagna' }

				pesto[:ingredients].should include 'baby spinach'
				pesto[:ingredients].should include 'water'
				pesto[:ingredients].should include 'lasagna noodles'
				pesto[:id].should include 'Slow-cooker-pesto-spinach-lasagna-310218'
			end
		end
	end
end


