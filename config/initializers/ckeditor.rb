# CKEditor Configuration for Rails 8
#
# CKEditor gem assets integration

if defined?(Ckeditor)
  Ckeditor.setup do |config|
    # Use CarrierWave for file uploads
    config.cdn_url = '//cdn.ckeditor.com/4.22.1/standard/ckeditor.js'

    # Asset model classes
    # config.picture_model { Ckeditor::Picture }
    # config.attachment_file_model { Ckeditor::AttachmentFile }

    # Authorize with CanCan
    config.authorize_with :cancan

    # Parent controller for CKEditor
    config.parent_controller = 'ApplicationController'

    # Current user method
    # config.current_user_method = 'current_user'
  end
end

