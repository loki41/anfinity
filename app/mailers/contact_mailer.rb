class ContactMailer < ActionMailer::Base
  default :from => "noreply@anfinity.dev"
  default :to => "amcl86@gmail.com"
 
  def new_message(message)
    @message = message
    mail(:subject => "#{message.subject}")
  end
end
