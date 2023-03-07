class BotController < ApplicationController
  def setup
    Reminder.new(params[:start_time], params[:end_time], params[:interval], params[:message]).setup
  end
end
