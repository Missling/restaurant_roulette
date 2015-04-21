get '/' do
  @user = User.new 
  erb :"index/home"
end

get '/register' do
  @user = User.new
  erb :"index/home"
end

post '/register' do
  @user = User.new(
    name: params[:name],
    email: params[:email],
    password: params[:password],
    )

  if @user.save
    session[:user_id] = @user.id
    redirect '/profile'
  else
    @errors = @user.errors.full_messages
    erb :"index/home"
  end
end

get '/login' do
  @user = User.new 
  erb :"index/login"
end

post '/login' do

  @user = User.where(email: params[:email]).first

  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    redirect '/profile'
  else
    @error = "Invalid Email or Password"
    erb :"index/home"
  end
end

get '/logout' do 
  session[:user_id] = nil
  redirect '/'
end

