class ListController < ApplicationController
	def show
		unless current_user
			user = User.new_guest
			sign_in(user)
		end
	end
end