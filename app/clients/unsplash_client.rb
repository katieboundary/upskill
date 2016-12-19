require 'uri'
require 'net/http'
require 'json'

class UnsplashClient
  def search(query)
    uri = URI("https://source.unsplash.com/1600x900")
    uri.query = query
    puts uri
    Net::HTTP.get(uri)
  end
end
