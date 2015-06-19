get '/' do
  # render home page
 #TODO: Show all users if user is signed in
  redirect '/signin'
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
  @user = User.where(user_name: params[:user_name]).first if params[:user_name]

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
    p '*' * 100
    p params
    p '*' * 100
    p session

  if params[:user][:password_hash] == params[:password]
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      #@user.id = session[:user_id]
      redirect '/surveys'
    end
  end
  @error = "Sorry! Your username, or password, or BOTH are incorrect."
  erb :sign_up
end




delete '/logout' do
  session[:user_id] = nil

  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
end

post '/users' do

end
