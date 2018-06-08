require 'open-uri'
require 'mime-types'
require 'sinatra'
require 'twilio-ruby'

post '/sms' do
  num_media = params['NumMedia'].to_i

  if num_media > 0
    for i in 0..(num_media - 1) do
      # Prepare the file information
      media_url = params["MediaUrl#{i}"]
      content_type = params["MediaContentType#{i}"]
      file_name = media_url.split('/').last
      file_extension = MIME::Types[content_type].first.extensions.first
      file = "#{file_name}.#{file_extension}"

      # Dowload the files
      open(media_url) do |url|
        File.open(file, 'wb') do |f|
          f.write(url.read)
        end
      end

    end
  end

  # Reply message
  twiml = Twilio::TwiML::MessagingResponse.new do |resp|
    body = num_media > 0 ? "Thanks for sending us #{num_media} file(s)!" : 'Send us an image!'
    resp.message body: body
  end

  content_type 'text/xml'
  twiml.to_s
end
