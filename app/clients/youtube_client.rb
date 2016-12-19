require 'uri'
require 'net/http'
require 'json'

class YoutubeClient
  def search(query)
    uri = URI("https://www.googleapis.com/youtube/v3/search")
    params = {part: "snippet", q: query + " tutorial", key: GOOGLE_API_YOUTUBE_KEY, maxResults: 10}
    uri.query = URI.encode_www_form(params)
    response = JSON.parse(Net::HTTP.get(uri))
    response["items"].map {|item| item["id"]["videoId"]}
  end
end
