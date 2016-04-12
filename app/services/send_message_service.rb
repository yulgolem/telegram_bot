require 'telegram/bot'

class SendMessageService

  def initialize(params)
    @message = params[:message]
    @user = params[:user]
  end

  def send_message
    TelegramBotJob.perform_async('qq')
  end

  private

  attr_reader :message, :user

  def message_attributes
    {
      message: message,
      user: user
    }
  end

end