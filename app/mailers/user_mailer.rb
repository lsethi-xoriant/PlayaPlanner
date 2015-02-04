class UserMailer < ActionMailer::Base
  default from: "hello@playaplanner.com"

  def packing_list(user)
  	@user = user
  	@items = user.items

  	mail(to: @user.email, subject: "Your Playa Packing List")
  end
end
