get '/' do
  if session['user_id']
    @user = User.find_by(id: session['user_id'])
  end
  erb :index
end

get '/secret' do
  if session['user_id'] != nil
    erb :'/sessions/secret_page'
  else
    redirect '/'
  end
end
