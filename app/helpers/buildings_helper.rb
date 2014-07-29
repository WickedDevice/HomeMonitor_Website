module BuildingsHelper


	def self.chart_data building, options = {}
		#Options can have a :max_points field,
		# => which fetches the most recent :max_points pieces of data

		hash = {}
		building.sensor_data.order("created_at DESC").limit(options[:max_points]).each do |datum|

	  		if hash[datum.created_at].nil?
				hash[datum.created_at] = [ datum ]
			else
				hash[datum.created_at] << datum
			end
		end
		return hash.sort
	end

	def chart_data building, options
		BuildingsHelper.chart_data building, options
	end

end
