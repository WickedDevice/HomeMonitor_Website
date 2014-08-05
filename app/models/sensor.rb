class Sensor < ActiveRecord::Base
	validates :device_id, presence:true, uniqueness:{scope: [:user_id, :building_id, :sensor_type]}, length:{minimum: 5}
	validates :name, presence:true, uniqueness:{scope: [:user_id, :building_id]}
	validates :sensor_type, presence: true
	validates :min_val, presence: true
	validates :max_val, presence: true

	has_many :sensor_data
	belongs_to :building

	after_initialize :init

	def channel
		device_id[-1]
	end

	def in_violation
		if self.sensor_data.last
			data = self.sensor_data.last.data
			return (data > max_val || data < min_val)
		else
			return false
		end
	end

	def sensor_id
		device_id[0..-2]
	end

	def in_building
		return !building.nil
	end

	def activate building_id
		self.update(activated:true, building_id:building_id)
	end

	def deactivate
		self.update(activated:false)
	end

	def unit
		case sensor_type
			when "Temp"
				suffix = "F"
			when "Humidity"
				suffix = "%"
			when "Rain"
				suffix = "mm"
			when "UV"
				suffix = "UV"
			end
		return suffix
	end

	def init
		self.activated = false if self.activated.nil?
	end
end