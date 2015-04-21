require 'yelp'

get '/profile' do
  # favorites = User.find(session[:user_id]).favorites]] 
  @favorites = User.find(session[:user_id]).restaurants
  erb :"search_view/profile"
end

post '/create_favorite' do
  restaurant = Restaurant.create(
    name: params[:name],
    yelp_url: params[:yelp_url],
    review_count: params[:review_count],
    rating: params[:rating],
    address: params[:address],
    phone: params[:phone],
    category: params[:category]
    )

  favorite = Favorite.create(
    user_id: session[:user_id],
    restaurant_id: restaurant.id
    )

  content_type('json')
  restaurant.to_json
end

get '/play_favorite' do
  @random_favorite = User.find(session[:user_id]).restaurants.shuffle.first
  content_type('json')
  @random_favorite.to_json
end

get '/searches' do
  erb :"search_view/searches"
end

post '/searches/new' do

  search_params = { term: 'restaurant' }

  if params.has_key?("category_filter") 
    search_params["category_filter"] = params[:category_filter]
  end

  location = params[:location]
  
  @results = Yelp.client.search(location, search_params)
  @result = @results.businesses[(Random.rand(1...20))]
  @favorites = User.find(session[:user_id]).restaurants
  erb :"search_view/profile"
end



