class Admin::TransactionsController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.json { render json: PaymentsDatatable.new(view_context) }
    end
  end

  def new
  	@transaction = Transaction.new
  	@order = Order.new
  	@line_items = LineItem.all
  end


end
