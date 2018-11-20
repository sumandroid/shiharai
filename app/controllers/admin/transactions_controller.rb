class Admin::TransactionsController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.json { render json: PaymentsDatatable.new(view_context) }
    end
  end

  def new
  	@users = User.all #to be replaced with current_user
  	@order = Order.new
  	@transaction = @order.transactions.build
  	@line_items = LineItem.all
  end


end
