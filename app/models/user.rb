class User < ApplicationRecord
  has_many :moments

  after_create

  has_secure_password

  validates :email, uniqueness: true
    validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

    before_create do |user|
      user.token = user.generate_api_key
    end

    def generate_api_key
      loop do
        token = SecureRandom.base64.tr('+/=', 'Qrt')
        break token unless User.exists?(token: token)
      end
    end

    def send_welcome_text
      if self.phone
  			@client = Twilio::REST::Client.new
        @sent_message = @client.messages.create(
  		      from: Rails.application.secrets.twilio_from,
  		      to: self.phone, # assumes that number is from US
  		      body: "Welcome to gratitude moment! You will now receive daily reminders to take a moment for gratitude, which you can then reply with something your grateful for."
  		    )
      end
    end
end
