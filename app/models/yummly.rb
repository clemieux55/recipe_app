require 'json'
require 'net/http'
require 'cgi'

	class Yummly

	 	attr_accessor :response, :attributes

	 	def initialize(query)
	 		@query = attributes(query)
	 	end

	 	def attributes(query)
	 		query.gsub!(/[,&^%$?~`]/,"")
	 		query.gsub(/[ ]/,"+")
	 	end

		def self.app_key
			@app_key = "api_key"
		end

		def self.app_id
			@app_id = "app_id"
		end

		def response
			@response ||= send_request
		end

		def recipes
			@recipes ||= response['matches'].map do |recipe|
				{ :name => recipe['recipeName'], :ingredients => recipe['ingredients'], :image => recipe['smallImageUrls'], :id => recipe['id'] }
			
			end
		end

	private
		
		def send_request
			uri = URI("http://api.yummly.com/v1/api/recipes?_app_id=#{Yummly.app_id}&_app_key=#{Yummly.app_key}&q=#{@query}&requirePictures=true")
			response = Net::HTTP.get(uri)
			JSON.parse(response)
		end


	end


