get '/search/new' do
  @search = Search.new
  
  erb :"search_view/search"
end

post '/search' do
  @search = Search.new(
    name = params[:name],
    start_date = params[:start_date],
    end_date = params[:end_date],
    location = params[:location],
    description = params[:description],
    )

  if @search.save 
    Result.create(
      user_id: session[:user_id],
      itinerary_id: @itinerary.id
      )
    redirect 'itinerary/#{@itinerary.id}/destination/new'
  else
    @errors = @itinerary.errors.full_messages
    erb :"itinerary_view/itinerary"
  end 
end