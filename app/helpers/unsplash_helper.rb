helpers do

  def find_photo(query)
    first_result = Unsplash::Photo.search(query || 'landscape').first
    first_result ||= Unsplash::Photo.search('landscape').first
    first_result.urls.full
  end
end


