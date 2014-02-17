class LinksController < ApplicationController

	def index
		redirect_to action:'new'
	end

	def new
		@link = Link.new
	end

	def create
		@link = Link.new(post_params)

		#generate url
		@link.shortened_url = generate_random_string

		if @link.save
			redirect_to action:'new'
		else
			render 'new'
		end
	end

	def show
		link = Link.find_by_shortened_url(params[:id])

		#create an entry for the visited link
		link.visitors.create(:ipaddr => request.remote_ip)

		redirect_to link.original_url
	end

	private 

		def generate_random_string(size = 5)
			charset = ('a'..'z').to_a + (0..9).to_a
			(0...size).map{ charset.to_a[rand(charset.size)] }.join
		end

		def post_params
			params.require(:link).permit(:original_url)
		end
end
