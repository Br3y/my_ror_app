class ClientsController < ApplicationController
  
  # This action uses query string parameters because it gets run 
  # by an HTTP GET request, but this does not make any difference
  # to how the parameters are accessed. The URL for 
  # this action would look like this to list activated
  # clients: /clients?status=activated
  def index
    @clients = params[:status] == "activated" ? Client.activated : Client.inactivated 
  end

  def new
    @client = Client.new
  end

  # This action uses POST parameters. They are most likely coming
  # from an HTML form that the user has submitted. The URL for
  # this RESTful request will be "/clients", and the data will be
  # sent as part of the request body.
  def create
    @client = Client.new(params[:client])
    if @client.save
      redirect_to @client
    else
      # This line overrides the default rendering behavior,
      # which would have been to render "create view"
      render "new"
    end
  end
end