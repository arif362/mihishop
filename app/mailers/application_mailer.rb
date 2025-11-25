class ApplicationMailer < ActionMailer::Base
  default from: 'info.mihishop@gmail.com'
  helper ProductHelper
  layout 'mailer'
end
