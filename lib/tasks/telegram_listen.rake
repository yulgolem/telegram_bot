require 'telegram/bot'
include Sidekiq::Worker

namespace :all do
  ListenerJob.perform_async
end