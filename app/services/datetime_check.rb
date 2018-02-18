class DatetimeCheck
	attr_accessor :deadline
	def initialize(deadline)
		@deadline = deadline
	end

	def perform
		validate_date(@deadline)
	end

	def validate_date(deadline)
		now = DateTime.now
		if now < deadline then true
		else false
		end
	end

end