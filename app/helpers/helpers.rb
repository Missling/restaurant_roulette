helpers do
  def test
    p "test"
  end
   
  def current_user
    session[:@user_id] = @user.id
  end
end