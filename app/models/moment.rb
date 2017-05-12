class Moment < ApplicationRecord
  belongs_to :user

  after_create :process_message

  def process_message
    @User = User.find_by_phone(phone)
    if @Use
    	self.update(user: @user)
    end
  end
end
