class ApplicationMailer < ActionMailer::Base
  default from: "webcat6@protonmail.com"
  layout "mailer"
  helper EmailHelper

  def thank_user_order(order)
    @order = order
    attachments["terms.pdf"] = File.read("/path/terms.pdf")

    attachments[photo.filename.to_s] = photo.download
    order.items.each_with_index do |item, i|
      if item.item_image.attached?
        attachments["img_#{i}"] = item.item_image.download
      else
        attachments["img_#{i}"] = item.image_url.download
      end
    end

    mail(to: @order.user.email, subject: "Merci pour votre commande")
  end

  def user_order_for_admin(order)
    admin = User.find_by(admin: true)
    @order = order
    mail(to: admin.email, subject: "Commande sur Kitten shop")
  end
end
