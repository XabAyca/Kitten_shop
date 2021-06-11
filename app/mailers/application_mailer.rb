class ApplicationMailer < ActionMailer::Base
  default from: "webcat6@protonmail.com"
  layout "mailer"
  helper EmailHelper

  def thank_user_order(order)
    @order = order
    attachments["test"] = @order.items[0].download
    mail(to: @order.user.email, subject: "Merci pour votre commande")
  end

  def user_order_for_admin(order)
    admin = User.find_by(admin: true)
    @order = order
    mail(to: admin.email, subject: "Commande sur Kitten shop")
  end
end
