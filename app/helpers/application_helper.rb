module ApplicationHelper
	def flash_class(level)
	    case level
	        when :notice then "label label-info"
	        when :success then "label label-success"
	        when :error then "label label-error"
	        when :alert then "label label-error"
	    end
	end
end
