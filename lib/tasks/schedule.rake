desc "This task is called by the Heroku scheduler add-on to send reminders for gratitude moments"
task send_text: :environment do
	puts "Daily Reminder CRON JOB /////////////////////////////////////////////////////////////////////////////////"
	puts "Daily Reminder CRON JOB /////////////////////////////////////////////////////////////////////////////////"
  @users = User.all
  @users.each do |user|
    puts user.name
  	if user.phone
			@client = Twilio::REST::Client.new
      @sent_message = @client.messages.create(
		      from: Rails.application.secrets.twilio_from,
		      to: user.phone, # assumes that number is from US
		      body: "What are you grateful for?"
		    )
  	end
  end
	puts "Daily Reminder CRON JOB /////////////////////////////////////////////////////////////////////////////////"
	puts "Daily Reminder CRON JOB /////////////////////////////////////////////////////////////////////////////////"
end
