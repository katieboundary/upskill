post '/progress_reviews' do
  @progress_review = ProgressReview.new(params[:progress_review])
  if @progress_review.save
    redirect to "/users/#{current_user.id}"
  else
    @errors = @user.errors.full_messages
    erb :index
  end
end
