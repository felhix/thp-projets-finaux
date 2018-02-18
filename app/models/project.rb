# == Schema Information
#
# Table name: projects
#
#  id                :integer          not null, primary key
#  title             :string
#  description       :text
#  short_description :string
#  pitch             :text
#  approved          :boolean          default(FALSE)
#  user_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Project < ApplicationRecord

		acts_as_commentable

		has_and_belongs_to_many :users, class_name: "User"
		
		belongs_to :user

		validates :user_id, presence: true

		validates :title, presence: true, uniqueness: true,
 	  	length: { minimum: 2, maximum: 50 }

		validates :description, presence: true,
 	 	 length: { minimum: 2 }

		validates :short_description, presence: true,
 	 	 length: { minimum: 2, maximum: 140 }

		validates :pitch, presence: true,
 	  	length: { minimum: 2 }
		    	
end





