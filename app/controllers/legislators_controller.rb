
class LegislatorsController < ApplicationController
	
	def index
		@legislators = LegislatorCollection.new([params[:search_param], params[:search_value]], params[:sort_by])
		@legislators = @legislators.collection
		if request.xhr?
	      render '/legislators/_index', layout: false
	    else
	      render 'index'
	    end
	end

	def show 

	end
end
