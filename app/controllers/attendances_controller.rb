class AttendancesController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @attendance = Attendance.where(event_id: params[:event_id])
  end

  def new 
    @amount = Event.find(params[:event_id]).price
    if @amount == 0
      @attendance = Attendance.create(stripe_customer_id: rand(1000..9999), participant_id: current_user.id, event_id: params[:event_id])
      redirect_to root_path
    end
  end

  def create
    @amount = Event.find(params[:event_id]).price * 100


    customer = Stripe::Customer.create(email: params[:stripeEmail], source: params[:stripeToken])
    charge = Stripe::Charge.create(customer: customer.id, amount: @amount, description: 'Rails Stripe customer', currency: 'usd')

    @attendance = Attendance.new(stripe_customer_id: customer.id, participant_id: current_user.id, event_id: params[:event_id])
    if @attendance.save
      flash[:success] = "You have been successfully registered!"
      redirect_to root_path
    else
      flash[:danger] = "Error"
      render "new"
    end
  end
end
