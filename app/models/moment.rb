class Moment < ApplicationRecord
  belongs_to :user, optional: true

  after_create :process_message

  # def process_message_delay
  # 	self.delay.process_message
  # end

  def process_message
    debugger
    @user = User.find_by_phone(phone)
    if @user
    	self.update(user: @user)
    end
  end
end
