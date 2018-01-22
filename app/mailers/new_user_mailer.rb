class NewUserEmail < ApplicationMailer
  def add_phone_number(user)
    @user = user
    mail(to:"smscampaignmanager@gmail.com",from:"smscampaignmanager@gmail.com",subject:"just another try")
    render plain:"Hello from mailer, this is just a test"
end
end
