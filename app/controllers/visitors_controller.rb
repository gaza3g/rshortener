class VisitorsController < ApplicationController

	def index
		@links = Link.joins(:visitors).select("links.*, count(visitors.link_id) as visitors_count").order("visitors_count DESC").group("links.id")
	end

	def show
		@visitors = Link.find_by_shortened_url(params[:id]).visitors
		if @visitors.empty?
			@visitors = Link.find(params[:id]).visitors
		end
		respond_to do |format|
		  format.html 
	      format.xml  { render xml: @visitors }
	      format.json { render json: @visitors }
	    end
	end
end