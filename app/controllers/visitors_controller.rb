class VisitorsController < ApplicationController

	def index
		@links = Link.all(:joins => :visitors, :group => 'visitors.link_id', :order => 'count(*)')
	end

	def show
		@visitors = Link.find(params[:id]).visitors
	end
end