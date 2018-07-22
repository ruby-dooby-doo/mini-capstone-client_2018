class Client::OrdersController < ApplicationController
  def show
    # get the data from the api and show it to the user
    order_id = params[:id]
    response = Unirest.get("localhost:3000/api/orders/#{order_id}")
    p 'respnse in show action'
    p response.body
    @order = response.body
    render "show.html.erb"
  end

  def create
    response = Unirest.post("localhost:3000/api/orders")
    order = response.body
    p "order in the create action"
    p order
    redirect_to "/client/orders/#{order['id']}"
  end
end
