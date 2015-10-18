class NotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.exsisting_account.subject
  #
  def exsisting_account(user)
    @user = user
    mail to: user.sales_manager_email, subject: "A client has entered the contest" 
  end
end
