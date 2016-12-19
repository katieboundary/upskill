get '/' do
  # search_results = Unsplash::Photo.search("landscape")
  if session['user_id']
    @user = User.find_by(id: session['user_id'])
  end
  erb :index
end

post '/search' do
  client = YoutubeClient.new
  puts "#{params}"
  @video_ids = client.search(params[:search][:q])
  @image_search_query = params[:search][:q]

  erb :search
end
