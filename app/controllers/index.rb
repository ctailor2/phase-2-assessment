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
