helpers do

  def has_review?
    if @user.progress_reviews.length == 0
      return false
    else
      return true
    end
  end


end
