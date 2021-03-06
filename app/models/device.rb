class Device < ActiveRecord::Base
	validates :encryption_key, presence: true
	validates :building_id, numericality: { only_integer: true, allow_nil: true }
	validates :address, uniqueness: true
	validates :name, presence: true

	#validates :user_id, numericality: { only_integer: true }
	belongs_to :building # This is the active building
	belongs_to :user
	has_many :device_buildings
	has_many :buildings, :through => :device_buildings

	def in_building?
		if self.building #not nil
			return self.building.active?
		else
			return false
		end
	end

	def checkout to_building_id
		if self.in_building? && (self.building_id != to_building_id)
			throw "Device #{id} in building"
		end
		self.building_id = to_building_id
		throw "Couldn't save device #{id}" if not self.save
	end

	def checkin building_id
		if building_id != self.building_id
			return true
		else
			self.building_id = nil
			return self.save
		end
	end

	 #This is slightly less ugly than the other way to do this
	alias_method :super_update, :update
	private :super_update
	def update(params)
		#Fail if it would change mid-building
		if in_building? && !params[building].nil? && params[building] != self.building_id
			return false
		end
		super_update(params)
	end

end
