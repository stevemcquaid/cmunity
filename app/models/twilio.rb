class Twilio < ActiveRecord::Base
  require 'twilio-ruby'
  def self.send_message(number_to_send_to, the_message)
    twilio_sid = "ACb18218cb24a64fe207de2f020d414ed7"
    twilio_token = "08faea04bc6260e3204e32c7898e5f4a"
    twilio_phone_number = "4128880020"
 
    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
 
    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => number_to_send_to,
      :body => the_message
    )
  end
end