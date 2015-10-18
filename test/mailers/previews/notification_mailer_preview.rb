# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notification_mailer/exsisting_account
  def exsisting_account
    NotificationMailer.exsisting_account
  end

end
