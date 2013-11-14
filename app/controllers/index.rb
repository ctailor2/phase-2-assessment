get '/' do
  @event_sampling = Event.all.sample(20)
  erb :index
end

get '/users/:user_id' do
  user = User.find(params[:user_id])
  @created_events = user.created_events
  @attended_events = user.attended_events
  erb :profile
end

get '/events/new' do
  if logged_in?
    erb :new_event
  else
    @errors = ["You must be logged in to create an event"]
    erb :login
  end
end

post '/events/new' do
  event_info = params[:event]
  event_info["user_id"] = current_user.id

  event = Event.create(event_info)

  if request.xhr?
    content_type :json

    event.to_json
  else
    redirect "/users/#{session[:user_id]}"
  end
end

get '/events/:event_id' do
  @event = Event.find(params[:event_id])
  erb :event_details
end
