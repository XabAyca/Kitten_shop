module EmailHelper
    def email_image_tag(image, **options)
      attachments[image] = File.read(Rails.root.join("rails/active_storage/blobs/redirect/#{image}"))
      image_tag attachments[image].url, **options
    end
end
