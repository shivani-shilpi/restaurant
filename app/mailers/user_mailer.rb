class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'

    def welcome_email(user_id)
      @user = User.find(user_id)
      # @url  = 'http://example.com/login'
      mail(
        from: "shivani@gmail.com",
        To: @user.email,
        Bcc: "cooper@gmail.com",
        Subject: "Hello"
      )

    # mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    end
end
