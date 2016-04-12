require 'telegram/bot'
include Sidekiq::Worker

class TelegramBotJob < ActiveJob::Base
  queue_as :default

  TOKEN = '174460210:AAH0oll-TVygX_1ohRL5Jju33t9PfUmG_aU'
  CHANNEL = '1224291'

  def perform(message)
    puts TOKEN
    puts CHANNEL

    Telegram::Bot::Client.run(TOKEN) do |bot|
      bot.api.send_message(chat_id: CHANNEL, text: 'hello')
    end

    puts '++++++++++++++++++++'
    puts message
    puts '++++++++++++++++++++'

  end
end