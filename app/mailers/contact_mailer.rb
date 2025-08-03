class ContactMailer < ApplicationMailer
    default to: 'amcl86@gmail.com'

    def contact_email(name, email, subject, message)
        @name = name
        @email = email
        @subject = subject
        @message = message

        mail(
            from: email,
            subject: "Anfinity Mail - #{subject}"
        )
    end
end
