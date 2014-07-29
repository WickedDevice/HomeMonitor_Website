class DeviceBuilding < ActiveRecord::Base
	belongs_to :building
	belongs_to :device

	def user_id
		if device && building && (device.user_id == building.user_id)
			return device.user_id
		elsif device && building
			return nil
		end

		return device.user_id if device
		return building.user_id if building
		return nil
	end

	def user
		User.find(user_id)
	end
end
