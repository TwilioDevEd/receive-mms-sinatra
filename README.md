<a href="https://www.twilio.com">
  <img src="https://static0.twilio.com/marketing/bundles/marketing/img/logos/wordmark-red.svg" alt="Twilio" width="250" />
</a>

# Receive and Download MMS Images
Use Twilio to receive SMS and MMS messages. For a step-by-step tutorial see the <a href="https://www.twilio.com/docs/guides/receive-and-download-images-incoming-mms-messages-ruby-sinatra">Twilio docs</a>.

## Note: protect your webhooks

Twilio supports HTTP Basic and Digest Authentication. Authentication allows you to password protect your TwiML URLs on your web server so that only you and Twilio can access them.

Learn more about HTTP authentication [here](https://www.twilio.com/docs/usage/security#http-authentication), which includes sample code you can use to secure your web application by validating incoming Twilio requests.

## Local development
This project is built using the [Sinatra](http://sinatrarb.com/) web framework.

1. First clone this repository and `cd` into it

   ```bash
   $ git clone git@github.com:TwilioDevEd/receive-mms-sinatra.git
   $ cd receive-mms-sinatra
   ```

2. Install the dependencies

   ```bash
   $ bundle install
   ```

3. Run the server

   ```bash
   $ ruby app.rb
   ```

4. Expose your application to the wider internet using [ngrok](http://ngrok.com). This step is important because the application won't work as expected if you run it through localhost.

   ```bash
   $ ngrok http 4567
   ```

   Once ngrok is running, open up your browser and go to your ngrok URL. It will look something like this: `http://<yourdomain>.ngrok.io`

   You can read [this blog post](https://www.twilio.com/blog/2015/09/6-awesome-reasons-to-use-ngrok-when-testing-webhooks.html) for more details on how to use ngrok.

5. Configure the Twilio Phone Number SMS Webhook

   On your Twilio Number dashboard, configure the incoming SMS Webhook to the following address:

   ```
   http://<yourdomain>.ngrok.io/sms
   ```

6. Send a SMS to your number with one or more images, and see them saved locally on your folder!

## Meta
* No warranty expressed or implied. Software is as is. Diggity.
* [MIT License](http://www.opensource.org/licenses/mit-license.html)
* Lovingly crafted by Twilio Developer Education.
