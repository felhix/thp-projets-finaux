class Project < ApplicationRecord

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





