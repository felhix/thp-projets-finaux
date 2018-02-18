# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#

class User < ApplicationRecord

	has_and_belongs_to_many :project_registrations, class_name: "Project"

	has_one :project, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save { email.downcase! }
	before_save { first_name.downcase! }
	before_save { last_name.downcase! }
       

  validates :first_name, presence: true,
 	  length: { minimum: 2, maximum: 255 }
	validates :last_name, presence: true,
 	  length: { minimum: 2, maximum: 255 }       

	validates :email, presence: true, if: :email_check
	
	# Check to see if email is on the list to validate registration process
	def email_check
	File.open(Rails.root.join('lib', 'csv', 'emails.csv'), "r") do |f|
		f.each_line do |line|
		  if line.split(',').any? { |mail| email.include?(mail)}
		 	else
		    errors.add(:email, "is not on our list")
		 	end
	 	 end
		end
	end

end


