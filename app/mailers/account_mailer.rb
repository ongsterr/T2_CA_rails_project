class AccountMailer < Devise::Mailer   
    helper :application # gives access to all helpers defined within `application_helper`.
    include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
    default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views

    def confirmation_instructions(record, token, opts={})
        headers["Custom-header"] = "Welcome to T2"
        opts[:from] = 'account_admin@t2.com'
        opts[:reply_to] = 'account_admin@t2.com'
        super
    end
end