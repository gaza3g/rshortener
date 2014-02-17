class LinksController < ApplicationController

	def new
	end

	def create
		render text: params[:link].inspect
	end
end
