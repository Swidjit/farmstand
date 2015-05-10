class ChargesController < ApplicationController

  def new
  end

  def create
    puts "hey"
    if user_signed_in?
      current_user.session_id = nil
      current_user.save
    end

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => params[:stripeCharge],
      :description => 'Farmstand purchase',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end


end
