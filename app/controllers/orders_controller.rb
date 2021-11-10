class OrdersController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @amount = @event.price
  end

  def create
    @user = current_user
    @amount = @event.price

    @event = Event.find(params[:event_id])
    @token = params[:stripeToken]
    
    redirect_to new_attendance_path(event: @event,token: @token)
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_order_path
    end
    # Before the rescue, at the beginning of the method
    # @stripe_amount = @amount * 100).to_i
    # begin
    #   customer = Stripe::Customer.create({
    #             email: params[:stripeEmail],
    #             source: params[:stripeToken],
    #   })
    #   charge = Stripe::Charge.create({
    #           customer: customer.id,
    #           amount: @stripe_amount,
    #           description: "Achat d'un produit",
    #           currency: 'eur',
    #   })
    # rescue Stripe::CardError => e
    #   flash[:error] = e.message
    #   redirect_to new_order_path
    # end
# After the rescue, if the payment succeeded
  # end
end
