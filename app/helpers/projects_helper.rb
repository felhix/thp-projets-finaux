module ProjectsHelper
	def datetimevalidator(session_pick)
		deadline = DateValidation.find_by(session_name: session_pick.session_name).project_lock
		unlocked = DatetimeCheck.new(deadline).perform
		return unlocked
	end

end
