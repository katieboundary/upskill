helpers do

  def find_photo(query)
    first_result = Unsplash::Photo.search(query || 'sunrise').first
    first_result ||= Unsplash::Photo.search('sunrise').first
    first_result.urls.full
  end
end


