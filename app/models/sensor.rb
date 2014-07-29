class Sensor < ActiveRecord::Base
	validates :device_id, presence:true, uniqueness:{scope: [:user_id, :building_id, :sensor_type]}, length:{minimum: 5}
	validates :name, presence:true
	validates :sensor_type, presence: true
	validates :min_val, presence: true
	validates :max_val, presence: true

	has_many :sensor_data
	belongs_to :building

	def channel
		device_id[-1]
	end

	def sensor_id
		device_id[0..-2]
	end

	def in_building
		return !building.nil
	end

	def unit
		case sensor_type
			when "Temp"
				suffix = "C"
			when "Humidity"
				suffix = "%"
			when "Rain"
				suffix = "mm"
			when "UV"
				suffix = "UV"
			end
		return suffix
	end
end