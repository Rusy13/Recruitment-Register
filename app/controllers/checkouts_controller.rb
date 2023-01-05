class CheckoutsController < ApplicationController
    before_action :authenticate_userexecutor!

    def show
      current_userexecutor.set_payment_processor :stripe
      current_userexecutor.payment_processor.customer
  
      @checkout_session = current_userexecutor
                          .payment_processor
                          .checkout(
                            mode: 'payment',
                            line_items: 'price_1MHU2hCg3liGDMS7AytlHcMN',
                            success_url: checkout_success_url  
                          )
    end
  
    def success
        @session = Stripe::Checkout::Session.retrieve(params[:session_id])
        @line_items = Stripe::Checkout::Session.list_line_items(params[:session_id])
    end
end