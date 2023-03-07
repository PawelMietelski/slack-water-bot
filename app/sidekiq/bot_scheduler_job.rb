class BotSchedulerJob
  include Sidekiq::Job

  def perform(message)
    SlackApiClient.new.post_message("general", message)
  end
end
