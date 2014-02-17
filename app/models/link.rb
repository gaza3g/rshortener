class Link < ActiveRecord::Base
	has_many  :visitors
	validates :original_url, :format => URI::regexp(%w(http https))
end
