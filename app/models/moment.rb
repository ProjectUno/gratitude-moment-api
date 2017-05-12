class Moment < ApplicationRecord
  belongs_to :user

  after_create :process_message

  def process_message
    @employee = Employee.find_by_phone(phone)
    if @employee
    	self.update(employee: @employee)
    end
  end
end
