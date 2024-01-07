class NotificationMailer < ApplicationMailer

  def send_contact_notification(contact)
    @contact = contact
    mail(to: 'info.mihishop@gmail.com', subject: "Contact request from: #{@contact.email}", from: 'mihishop@gmail.com')
  end

  def send_subscription_notification(email)
    @email = email
    mail(to: email, subject: 'mihishop subscription gift', from: 'info.mihishop@gmail.com')
  end

end
