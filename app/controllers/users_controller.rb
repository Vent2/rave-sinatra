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
			redirect '/users/failure'
    end
  end

    get "/users/homepage" do
      if logged_in?
      @user = User.find(session[:user_id])
        erb :"users/homepage"
      else
        redirect '/users/login'
      end
    end
  
    get "/users/failure" do
      erb :"users/failure"
    end

    get '/sessions/logout' do
      session.clear
      redirect '/'
    end

    get '/users/:id/edit' do  #load edit form
      @user = User.find_by_id(params[:id])
      erb :edit
    end

    patch '/users/:id' do #edit action
      @user = User.find_by_id(params[:id])
      @user.name = params[:name]
      @user.email = params[:email]
      @user.password = params[:password]
      @user.save
      redirect to "/users/#{@user.id}"
    end


    #Helper
    helpers do
      def logged_in?
        !!session[:user_id]
      end
  
      def current_user
        User.find(session[:user_id])
      end
    end
end
