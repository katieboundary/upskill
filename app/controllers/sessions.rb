#No session model or table are needed. It is not an active record object, but we still treat the controller as such

get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.authenticate(params)
  if @user
    # session['user_id'] = user.id
    login(@user)
    redirect "/users/#{@user.id}"
  else
    @error = "Login Failed"
    erb :'/sessions/new'
  end
end

delete '/sessions/:id' do
  # session['user_id'] = nil
  logout
  redirect '/'
end


