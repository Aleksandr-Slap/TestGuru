class FeedBackMailer < ApplicationMailer
  ADMIN_EMAIL = 'aleksandrslap@gmail.com' 

  def create(message, user)
    @user = user
    @message = message
    mail to: ADMIN_EMAIL, subject: "Feedback"
  end  
end
