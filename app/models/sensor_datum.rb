class SensorDatum < ActiveRecord::Base
	validates :title, presence: true
	validates :data, presence: true
	belongs_to :device
	belongs_to :building

	@device_address = nil
	attr_accessor :device_address

	def user_id
		if !device.nil? and !device.user_id.nil?
			return device.user_id
		elsif !building.nil? and !building.user_id.nil?
			return building.user_id.nil?
		end
	end

	def resolve_device_id
		if !@device_address.nil? && device_id.nil?
			self.device = Device.find_by address: @device_address
		end
	end

	def resolve_building_id
		if device and device.in_building?
			self.building = self.device.building
		end
	end

	def self.to_csv
		CSV.generate do |csv|
			csv << ["Sensor data as of #{Time.zone.now.to_s(:custom_csv)}"]
			csv << ["Temp","Time measured", "Building","Building location", "Sensor location", "Sensor name"]
			all.each do |datum|
				device_building = DeviceBuilding.find_by(building_id: datum.building_id, device_id: datum.device_id)
				device_location = device_building.nil? ? "Unknown": device_building.location

				building = datum.building
				building_location = building.nil? ? "Unknown" : building.location
				building_name = building.nil? ? "No building" : building.name

				csv << [datum.title, datum.data, datum.created_at.in_time_zone.to_s(:custom_csv) , building_name, building_location, device_location, datum.device.name]
			end
		end
	end

	def self.batch_create(params)
		puts "Params #{params}"
		if params.nil? #|| params["title"].nil?
			return false
		end

		success = true

		device = Device.find_by address: params["device_address"]
		complete_id = params["sensor_datum"]["DevID"]+params["sensor_datum"]["Channel"]
		sensors = Sensor.all.where(device_id:complete_id, building_id:device.building_id)
		
		#Offline sensor mode
		# => Still expects the user to have set up the building ahead of time.
		if params["building_id"] == -1 and device.in_building?
			building_id = device.building_id
		else
			building_id = params["building_id"]
		end
		
		if sensors != nil
		#device.checkin 3 # building_id
		sensors.each do |sensor|
		#params["title"].each do |time, title, data|
			sensor_datum = SensorDatum.new()
			sensor_datum.building_id = building_id
			sensor_datum.device = device
			sensor_datum.title = complete_id
			sensor_datum.data = params["sensor_datum"][sensor.sensor_type].to_f / 10.0
			sensor_datum.sensor_id = sensor.id
			sensor_datum.created_at = Time.now

			success &= sensor_datum.save
		end
	end
		return success
	end
end
