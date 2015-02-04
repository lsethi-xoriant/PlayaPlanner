class UserMailer < ActionMailer::Base
  default from: "hello@playaplanner.com"

  def packing_list(user, email)
  	@user = user
  	@items = user.items
  	mail(to: email, subject: "Your Playa Packing List")
  end
end
