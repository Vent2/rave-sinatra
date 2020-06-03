class RavesController < ApplicationController

  # GET: /raves
  get "/raves" do
    erb :"/raves/index.html"
  end

  # GET: /raves/new
  get "/raves/create" do
    erb :"/raves/create"
  end

  # POST: /raves
    post '/raves' do #processes post form
      @raves = Rave.create(
          user_id: session[:user_id],
          name: params[:name], 
          travel_cost: params[:travel_cost], 
          food_cost: params[:food_cost],
          hotel_cost: params[:hotel_cost],
          total: params[:total]
          )
          redirect "/raves/#{@raves.id}"
    end



  # GET: /raves/5
  get "/raves/:id" do
    @raves = Rave.find_by_id(params[:id])
    erb :"/raves/show.html"
  end

  # GET: /raves/5/edit
  get "/raves/:id/edit" do
    erb :"/raves/edit.html"
  end

  # PATCH: /raves/5
  patch "/raves/:id" do
    redirect "/raves/:id"
  end

  # DELETE: /raves/5/delete
  delete "/raves/:id/delete" do
    redirect "/raves"
  end
end