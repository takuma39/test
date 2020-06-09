class UserNotifierMailer < ApplicationMailer
	def send_signup_email(user)
        @user = user
        @url = "ホームページのurl"
        mail( :to => @user.email, :subject => "会員登録が完了しました。" )
    end
end
