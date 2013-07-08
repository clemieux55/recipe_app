class Yummly

	attr_accessor :search

	def initialize(search={})
		@search = search
	end

	def app_key
		@app_key = "53ec12be3b85d0086a735dba82e215e2"
	end

	def app_id
		@app_id = "4b0aee5d"
	end

	def send_request
		uri = URI("http://api.yummly.com/v1/api/recipes?_app_id=#{app_id}&_app_key=#{app_key}&q=#{@search}")	
		response = JSON.parse(Net::HTTP.get(uri))['matches']
		@response = response.first
	end

	def name(attributes)
		attributes['recipeName']
	end

	def ingredients(attributes)
		attributes['ingredients']
	end

	def cuisine(attributes)
		attributes['attributes']['cuisine']
	end

end

