# TODO
# Send out a get request at 3 inthe morning with and admin password 
# which will tell the server to update the DB


require 'legislator'
require 'httparty'
require 'json'
require 'objspace'

class LegislatorCollection
	@@congress_collection = { updated_last: nil, collection: []}
	PROPUBLICA_API = 'https://api.propublica.org/congress/v1/'

	UPDATE_PERIOD = 1 # in days
	attr_reader :collection
	
	def initialize(search_parameter=nil, sort_by=nil)

		if @@congress_collection[:updated_last] == nil
			@@congress_collection[:updated_last] = Time.new 
			self.class.updateDB
		end

		self.class.updateDB if self.class.updateDB?
		
		if search_parameter != nil 
			@collection = @@congress_collection[:collection].select do |legislator|
			  legislator.json[search_parameter[0]] == search_parameter[1] 
			end
		else
			@collection = @@congress_collection[:collection]
		end
		
		@collection = @collection.sort_by { |legislator| legislator.json[sort_by]} if sort_by != nil

	end

	def self.congress_collection
		@@congress_collection
	end

private
	def by_party(party)
		@collection.select { |legislator| legislator.party == party}
	end

	def by_state(state)
		@collection.select { |legislator| legislator.state == state}
	end

	def by_name(first_last_or_full, name)
		case first_last_or_full
		when "first"
			@collection.select { |legislator| legislator.first_name == name}

		when 'last'
			@collection.select { |legislator| legislator.last_name == name}
		when 'full'
			first, last = name.split(" ")
			@collection.select { |legislator| legislator.first_name == first}
			.select { |legislator| legislator.last_name == last}
		else
			
		end
	end


	def self.updateDB?
		(@@congress_collection[:updated_last] - Time.new) > (UPDATE_PERIOD * 86400) 
	end

	def self.updateDB
		puts "api key: #{PROPUBLICA_API_KEY}"
		@@congress_collection[:updated_last] = Time.new
		@@congress_collection[:collection] = []

		res = HTTParty.get("#{PROPUBLICA_API}114/house/members.json",
							:headers => {"X-API-Key" => PROPUBLICA_API_KEY }
							)
		puts res
		# Gets JSON members
		members = res["results"].first["members"]

		# Creates a Legislator instance for each 
	  	members.each do |legislator|
	  		@@congress_collection[:collection] << Legislator.new(legislator)
	  	end

	end
end