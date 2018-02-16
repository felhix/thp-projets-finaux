class User < ApplicationRecord

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


