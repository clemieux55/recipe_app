require 'spec_helper'

describe 'Yummly', focus: true do 
	let(:yummly) { Yummly.new('lasagna') }

	it 'sends a request to the yummly api and returns a hash' do 
		VCR.insert_cassette('yummly')
		response = yummly.send_request
		expect(response).to be_kind_of(Hash)
		expect(yummly.request_fields).to include('Lasagna')
		binding.pry
	end
end


VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
end