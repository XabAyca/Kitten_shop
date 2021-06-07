class UserMailer < ApplicationMailer
    default from: "webcat6@protonmail.com"
    layout 'mailer'

    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Bienvenue dans la communauté')
    end
end
