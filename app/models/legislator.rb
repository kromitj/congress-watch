require 'httparty'

class Legislator
  SUNLIGHT_CONGRESS_API = 'https://congress.api.sunlightfoundation.com'  
  include ActiveModel::Validations
  attr_reader :thomas_id, :api_uri, :first_name, :middle_name, :last_name, :party, :twitter_account, :facebook_account, :facebook_id, :url, :rss_url, :domain, :dw_nominate, :ideal_point, :seniority, :next_election, :total_votes, :missed_votes, :total_present, :state, :missed_votes_pct, :votes_with_party_pct
  def initialize(attrs)
     @thomas_id = attrs["thomas_id"]
     @api_uri = attrs["api_uri"]
     @first_name = attrs["first_name"]
     @middle_name = attrs["middle_name"]
     @last_name = attrs["last_name"]
     @party = attrs["party"]
     @twitter_account = attrs["twitter_account"]
     @facebook_account = attrs["facebook_account"]
     @facebook_id = attrs["facebook_id"]
     @url = attrs["url"]
     @rss_url = attrs["rss_url"]
     @domain = attrs["domain"]
     @dw_nominate = attrs["dw_nominate"]
     @ideal_point = attrs["ideal_point"]
     @seniority = attrs["seniority"]
     @next_election = attrs["next_election"]
     @total_votes = attrs["total_votes"]
     @missed_votes = attrs["missed_votes"]
     @total_present = attrs["total_present"]
     @state = attrs["state"]
     @missed_votes_pct = attrs["missed_votes_pct"]
     @votes_with_party_pct = attrs["votes_with_party_pct"]	    
  end

  def party
  	@party
  end

  def json
  	 {
  	 "thomas_id" => @thomas_id,
     "api_uri" => @api_uri,
     "first_name" => @first_name,
     "middle_name" => @middle_name,
     "last_name" => @last_name,
     "party" => @party,
     "twitter_account" => @twitter_account,
     "facebook_account" => @facebook_account,
     "facebook_id" => @facebook_id,
     "url" => @url,
     "rss_url" => @rss_url,
     "domain" => @domain,
     "dw_nominate" => @dw_nominate,
     "ideal_point" => @ideal_point,
     "seniority" => @seniority,
     "next_election" => @next_election,
     "total_votes" => @total_votes,
     "missed_votes" => @missed_votes,
     "total_present" => @total_present,
     "state" => @state,
     "missed_votes_pct" => @missed_votes_pct,
     "votes_with_party_pct" => @votes_with_party_pct}
  end
  
end

