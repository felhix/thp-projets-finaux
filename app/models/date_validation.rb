# == Schema Information
#
# Table name: date_validations
#
#  id           :integer          not null, primary key
#  project_lock :datetime
#  session_name :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class DateValidation < ApplicationRecord
	validates_presence_of :project_lock, :session_name

end
