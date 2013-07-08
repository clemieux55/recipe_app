require 'spec_helper'

describe 'Yummly', focus: true do 
	let(:yummly) { Yummly.new('lasagna') }

	it 'sends a request to the yummly api and returns a hash' do 
		VCR.insert_cassette('yummly')
		response = yummly.send_request
		expect(response).to be_kind_of(Hash)
	end

	it 'returns recipes for the criteria inputted' do 
		VCR.use_cassette('yummly_response') do 
			response = yummly.send_request
			expect(yummly.name(response)).to include('Lasagna')
			expect(yummly.ingredients(response)).to include('salt')
			expect(yummly.cuisine(response)).to include('Italian')
		end
	end 
end


VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
end