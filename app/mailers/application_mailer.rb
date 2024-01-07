class ApplicationMailer < ActionMailer::Base
  default from: 'info.mihishop@gmail.com'
  add_template_helper(ProductHelper)
  layout 'mailer'
end
