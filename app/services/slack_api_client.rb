class SlackApiClient
  include HTTParty
  base_uri "https://slack.com/api"
  SLACK_BOT_TOKEN = "xoxb-4889777357317-4893097684739-NrQxKCpYJzB88Zk0QgXgMxu2"

  def initialize
    @options = {
      headers: {
        "Authorization" => "Bearer #{SLACK_BOT_TOKEN}",
        "Content-Type" => "application/json"
      }
    }
  end

  def post_message(channel, text)
    self.class.post("/chat.postMessage",  @options.merge( body: { text: text, channel: channel }.to_json))
  end
end