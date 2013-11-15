get '/login' do
  if logged_in?
    redirect '/'
  else
    erb :login
  end
end

get '/register' do
  if logged_in?
    redirect '/'
  else
    erb :register
  end
end

post '/login' do
  email = params[:user][:email]
  password = params[:user][:password]

  user = User.find_by_email(email)
  if !user.nil?
    auth_user = user.authenticate(password)
    if auth_user
      session[:user_id] = auth_user.id
      redirect "/users/#{current_user.id}"
    else
      @errors = ["Password incorrect"]
      erb :login
    end
  else
    @errors = ["Email not found"]
    erb :login
  end
end

post '/register' do
  user = User.create(params[:user])
  if !user.id.nil?
    session[:user_id] = user.id
    redirect "/users/#{current_user.id}"
  else
    @errors = user.errors.full_messages
    erb :register
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
