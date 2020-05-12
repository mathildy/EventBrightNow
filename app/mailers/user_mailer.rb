class UserMailer < ApplicationMailer
    default from: 'mathilde.prouchandy@gmail.com'
   
    def welcome_email(user)
      @user = user 
  
      @url  = 'https://event-bright-now.herokuapp.com' 
  
      mail(to: @user.email, subject: 'Bienvenue sur notre site !') 
    end
  end
