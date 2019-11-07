class ChargesController < ApplicationController
  def new
  end

def create
  # Amount in cents
  #@amount = 500

  customer = Stripe::Customer.create({
    email: params[:stripeEmail],
    source: params[:stripeToken],
  })

  subscription = Stripe::Subscription.create({
    customer: customer.id,
    plan: "plan_G8FtqbcawJzjs9"

    })

 current_user.payment = true
 current_user.stripe_id = customer.id
 current_user.sub_id = subscription.id
 current_user.save

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def unsubscribe

  subscription = Stripe::Subscription.update(
  current_user.sub_id,
  {
    cancel_at_period_end: true,
  })
  current_user.payment = false
  current_user.save
  
  redirect_to new_charge_path

  end

end
