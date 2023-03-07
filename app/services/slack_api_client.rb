class SlackApiClient
  include HTTParty
  base_uri "https://slack.com/api"

  def initialize
    @options = {
      headers: {
        "Authorization" => "Bearer #{ENV["SLACK_BOT_TOKEN"]}",
        "Content-Type" => "application/json"
      }
    }
  end

  def post_message(channel, text)
    self.class.post("/chat.postMessage",  @options.merge( body: { text: text, channel: channel }.to_json))
  end
end