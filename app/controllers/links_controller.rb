class LinksController < ApplicationController

	def index
		redirect_to action:'new'
	end

	def create
		@link = Link.new(post_params)
		@link.shortened_url = "meme"
		@link.save
		redirect_to action:'new'
	end

	def show
		link = Link.find_by_shortened_url(params[:id])
		redirect_to link.original_url
	end

	private 
		def post_params
			params.require(:link).permit(:original_url)
		end
end
