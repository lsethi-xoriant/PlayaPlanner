class List < ActiveRecord::Base
	has_one :user_id
	has_many :items
end
