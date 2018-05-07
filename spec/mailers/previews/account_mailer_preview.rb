# Preview all emails at http://localhost:3000/rails/mailers/account_mailer

class AccountMailerPreview < ActionMailer::Preview

    def confirmation_instructions
        AccountMailer.confirmation_instructions(User.first, "faketoken", {})
    end

    def reset_password_instructions
        AccountMailer.reset_password_instructions(User.first, "faketoken", {})
    end

    def unlock_instructions
        AccountMailer.unlock_instructions(User.first, "faketoken", {})
    end
end