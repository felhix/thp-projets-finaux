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

require 'test_helper'

class DateValidationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
