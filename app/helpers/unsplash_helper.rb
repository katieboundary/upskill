helpers do

  def find_photo(query)
    Unsplash::Photo.search(query || 'landscape').first.urls.full
  end
end


