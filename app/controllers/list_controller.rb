class ListController < ApplicationController
	def show
		unless current_user
			user = User.new_guest
			sign_in(user)
		end
	end

	def print
		@items = current_user.items.order('category')
		render '/list/print.pdf.prawn'
	end

	def email
		#TODO use delayed job
		UserMailer.packing_list(current_user).deliver!
		redirect_to :back
	end
end