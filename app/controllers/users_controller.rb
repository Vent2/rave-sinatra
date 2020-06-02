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
    user = User.new(name: params[:name], email: params[:email], password: params[:password])
		if user.save
			redirect '/users/login'
		else
			redirect '/users/failure'
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
        erb :"users/homepage"
    end
  
    get "/failure" do
      erb :failure
    end
  
    get "/logout" do
      session.clear
      redirect "/"
    end
#   # GET: /users/5
#   get "/users/:id" do
#     erb :"/users/login.html"
#   end

#   # GET: /users/5/edit
#   get "/users/:id/edit" do
#     erb :"/users/edit.html"
#   end

#   # PATCH: /users/5
#   patch "/users/:id" do
#     redirect "/users/:id"
#   end

#   # DELETE: /users/5/delete
#   delete "/users/:id/delete" do
#     redirect "/users"
#   end
end
