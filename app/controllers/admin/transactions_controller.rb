class Admin::TransactionsController < ApplicationController

  require 'razorpay'

  def index
    respond_to do |format|
      format.html
      format.json { render json: PaymentsDatatable.new(view_context) }
    end
  end

  def new
    @users = User.all
    @order = Order.new
    @transaction = @order.transactions.build
    @order_line_items = @order.order_line_items.build
  end


  def authenticate_razorpay_payment
  	razorpay_payment_id = params[:payment_id]
  	line_item_id = params[:line_item_id]
  	razorpay_response = Razorpay::Payments::Authenticate.new(razorpay_payment_id, line_item_id).run
  	if razorpay_response
  		render json: {status: 'success', payment_hash: razorpay_response.attributes, mode: 'razorpay'}
  	else
  		render json: {status: 'failure'}
  	end
  end

  def create
  	order = Orders::Create.new(order_params).run
  	if is_razorpay_payment?
  		Razorpay::Payments::Create.new(payment_params, order).run
  	else
  		flash[:notice] = 'Payment not created. There is some error.'
  	end
  	render :index
  end


  private 

  def order_params
  	params[:transaction][:order_attributes]
  end

  def payment_params
  	params[:payment_hash]
  end

  def is_razorpay_payment?
  	params[:mode].to_sym == :razorpay
  end


end
