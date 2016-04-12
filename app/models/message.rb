class Message < ActiveRecord::Base
  after_create :send_message

  def send_message
    SendMessageService.new({
      message: self.message,
      user: self.user
    }).send_message
  end
end
