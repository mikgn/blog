class ApplicationMailer < ActionMailer::Base
  default from: "myblog@service.com"
  layout 'mailer'
end
