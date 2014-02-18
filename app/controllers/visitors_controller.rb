class VisitorsController < ApplicationController

	def index
		@links = Link.joins(:visitors).select("links.*, count(visitors.link_id) as visitors_count").order("visitors_count DESC").group("links.id")
	end

	def show
		@visitors = Link.find(params[:id]).visitors
	end
end