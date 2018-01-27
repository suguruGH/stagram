class PictureMailer < ApplicationMailer
    def picture_mail(picture)
     @picture = picture
     mail to: "sgrkmy@gmail.com", subject: "stagramからの確認メール"
    end
end
