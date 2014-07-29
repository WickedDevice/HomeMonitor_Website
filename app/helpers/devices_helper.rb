module DevicesHelper

	def first_contact_string(device)
		string = Time.now.to_i.to_s + " "

		if @device.nil?
        	string << "<p>Device not found</p>"
		elsif @device.in_building?
			string << "In_Building: "
			string << device.building_id.to_s + " "
			#string << "CO2_cutoff: "
			#string << device.building.co2_cutoff.to_s + " "
		else
			string << -1.to_s
		end
		return string
	end

end

