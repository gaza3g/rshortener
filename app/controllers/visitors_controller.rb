class VisitorsController < ApplicationController

	def index
		@links = Link.joins(:visitors).select("links.*, count(visitors.link_id) as visitors_count").order("visitors_count DESC").group("links.id")
	end

	def show
		link = Link.find_by_shortened_url(params[:id])
		if link.nil?
			link = Link.find(params[:id])
		end
		@visitors = link.visitors
		respond_to do |format|
		  format.html 
	      format.xml  { render xml: @visitors }
	      format.json { render json: @visitors }
	    end
	end
end