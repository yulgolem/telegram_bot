require 'telegram/bot'
include Sidekiq::Worker

class ListenerJob < ActiveJob::Base
  queue_as :default

  TOKEN = '174460210:AAH0oll-TVygX_1ohRL5Jju33t9PfUmG_aU'
  #CHANNEL = '1224291'

  def perform(response)
    Telegram::Bot::Client.run(TOKEN) do |bot|
      bot.listen do |message|
        case message.text
        when '/start'
          bot.api.send_message(chat_id: message.chat.id, text: 'Hello there!')
        when '/test'
          bot.api.send_message(chat_id: message.chat.id, text: 'test passed')
        end
      end
    end

    puts '++++++++++++++++++++'
    puts message
    puts '++++++++++++++++++++'

  end

end