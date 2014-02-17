class Link < ActiveRecord::Base
	validates :original_url, :format => URI::regexp(%w(http https))
end
