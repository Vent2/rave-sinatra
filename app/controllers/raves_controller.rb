class RavesController < ApplicationController

  # GET: /raves
  get "/raves" do
    erb :"/raves/index.html"
  end

  # GET: /raves/new
  get "/raves/new" do
    erb :"/raves/new.html"
  end

  # POST: /raves
  post "/raves" do
    redirect "/raves"
  end

  # GET: /raves/5
  get "/raves/:id" do
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
