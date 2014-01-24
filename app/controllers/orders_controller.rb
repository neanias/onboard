class OrdersController < ApplicationController

  before_action :make_sure_logged_in

  def index
    @orders = current_user.orders.all
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def new
    # Let's find the room from our routes
    @room = Room.find(params[:room_id])
    @order = @room.orders.new
    @order.user = current_user
  end

  def create
    # Submitted the form and let's save the order
    @room = Room.find(params[:room_id])
    @order = @room.orders.new(order_params)
    @order.user = current_user

    if @order.save

      # We want to charge Stripe with the token
      Stripe::Charge.create(card: @order.stripe_token,
        description: "Room on Onboard", amount: (@room.price * 100).to_i,
        currency: 'gbp')

      flash[:success] = "You've booked this room"
      redirect_to room_path(@room)
    else
      render 'new'
    end
  end

  private

  def order_params
    params.require(:order).permit(:stripe_token)
  end

end
