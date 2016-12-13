get '/users' do
  @users = User.all
  erb :'/users/index'
end

get '/users/new' do
  erb :'/users/new'
end

get '/users/:id' do
  @user = User.find(params[:id])
  if @user.id != session['user_id']
    status 403
    return "You shall not pass!!!"
  end
  erb :'/users/show'
end

# save new user
post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session['user_id'] = @user.id
    redirect to "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :'/users/edit'
end

# update a user and save to db
put '/users/:id' do
  @user = User.find(params[:id])
  @user.update(params[:user])

  redirect to "/users/#{@user.id}"
end

delete '/users/:id' do
  @user = User.find(params[:id])
  @user.destroy

  redirect to '/users'
end
