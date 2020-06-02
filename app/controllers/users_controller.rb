class UsersController < ApplicationController
  
  configure do
		set :views, "app/views"
		enable :sessions
		set :session_secret, "password_security"
	end

  # GET: Sign up
  get "/users/signup" do
    erb :"/users/signup.html"
  end

  # POST: /users
  post "/signup" do
    if params[:name] == "" || params[:email] == "" || params[:password] == ""
      redirect '/users/failure'
    else
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect '/users/homepage'
    end 
  end
  
  get "/users/login" do
		erb :"/users/login.html"
  end
  
  post "/users/login" do
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect '/users/homepage'
		else
			redirect '/failure'
    end
  end

    get "/users/homepage" do
      @user = User.find(session[:user_id])
        erb :"users/homepage"
    end
  
    get "/users/failure" do
      erb :"users/failure"
    end
  
    get "/logout" do
      session.clear
      redirect "/"
    end

    get '/sessions/logout' do
      session.clear
      redirect '/'
    end
#   # PATCH: /users/5
#   patch "/users/:id" do
#     redirect "/users/:id"
#   end

#   # DELETE: /users/5/delete
#   delete "/users/:id/delete" do
#     redirect "/users"
#   end
end
