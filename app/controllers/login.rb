get '/' do
  # render home page
 #TODO: Show all users if user is signed in
  erb :index
end

#----------- SESSIONS -----------

get '/signin' do
  if current_user
    redirect '/surveys'
  else
    erb :sign_in
  end
end

post '/signin' do
  @user = User.where(username: params[:username]).first if params[:username]

  if @user && @user.password_hash == params[:password_hash]
    session[:user_id] = @user.id
    redirect '/surveys'
  else
    @errors = "You suck."
    erb :sign_in
  end
end

get '/signup' do
  if current_user
    @errors = "You're already logged in."
    redirect '/surveys'
  else
    erb :sign_up
  end
end

post '/signup' do

  if params[:]

  @user = User.new(params[:user])
  if @user.save
    @user.id = session[:user_id]
    redirect '/surveys'
  end
end




delete '/sessions/:id' do
  # sign-out -- invoked
end

#----------- USERS -----------

get '/users/new' do
end

post '/users' do

end
