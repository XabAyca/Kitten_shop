class ApplicationMailer < ActionMailer::Base
  default from: "webcat6@protonmail.com"
  layout 'mailer'


  def thank_user_order(order)
    @order = order
    mail(to: @order.user.email, subject: 'Merci pour votre commande')
  end


end
