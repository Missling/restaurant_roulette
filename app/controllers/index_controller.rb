get '/' do 
  erb :"index/home"
end

get '/register' do
  @user = User.new
  erb :"index/register"
end

post '/register' do
  @user = User.new(
    name: params[:name],
    email: params[:email],
    password: params[:password],
    )

  if @user.save
    current_user
    redirect '/search/new'
  else
    @errors = @user.errors.full_messages
    erb :"index/register"
  end
end

get '/login' do
  @user = User.new 
  erb :"index/login"
end

post '/login' do

  @user = User.where(email: params[:email]).first

  @user.password == params[:password]
  if @user && @user.password == params[:password]
    current_user
    redirect '/search/new'
  else
    @errors = @user.errors.full_messages
    erb :"index/login"
  end
end

get '/logout' do 
  session[:user_id] = nil
  redirect '/'
end

