class Reminder
  attr_reader :start_time, :end_time, :message, :interval

  def initialize(start_time, end_time, interval, message)
    @start_time = start_time
    @end_time = end_time
    @interval = interval
    @message = message
  end

  def setup
    (start_time.to_datetime.to_i .. (end_time).to_datetime.to_i).step(interval.to_i.seconds) do |date|
      BotSchedulerJob.perform_at(date, message)
    end
  end
end