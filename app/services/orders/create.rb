module Orders
	class Create
		def initialize(params)
			@user_id = params[:user]
			@line_item_id = params[:order_line_items]
		end

		def run
			create_order_line_item
			create_order
			update_order_to_line_item
			return order
		end

		private


		def create_order
			@order = Order.new(total_amount: order_line_item.amount, amount_paid: order_line_item.amount, user_id: user_id)
			order.save!
		end

		def create_order_line_item
			line_item = LineItem.where(id: line_item_id).first
			@order_line_item = OrderLineItem.create(title: line_item.title, amount: line_item.amount)
		end

		def update_order_to_line_item
			order_line_item.update(order: order)
		end

		attr_accessor :user_id, :line_item_id, :order, :order_line_item

	end
end