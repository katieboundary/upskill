post '/skills' do
  @skill = Skill.new(params[:skill])
  if @skill.save
    redirect to "/search"
  else
    erb :index
  end
end
