class AttendancesController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @attendance = Attendance.where(event_id: params[:event_id])
  end

  def new 
    @amount = Event.find(params[:event_id]).price
    FreePrice.new(params[:event_id], current_user.id, @amount).perform
    redirect_to root_path if @amount == 0
  end

  def create
    @amount = Event.find(params[:event_id]).price

    customer = Stripe::Customer.create({email: params[:stripEmail], source: params[:stripeToken]})
    charge = Stripe::Charge.create({customer: customer.id, amount: @amount, description: 'Rails Stripe customer', currency: 'usd'})

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path

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
