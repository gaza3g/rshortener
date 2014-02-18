class VisitorsController < ApplicationController

	def index
		@links = Link.joins(:visitors).select("links.*, count(visitors.link_id) as visitors_count").order("visitors_count DESC").group("links.id")
	end

	def show
		@visitors = Link.find(params[:id]).visitors
		respond_to do |format|
		  format.html 
	      format.xml  { render xml: @visitors }
	      format.json { render json: @visitors }
	    end
	end
end