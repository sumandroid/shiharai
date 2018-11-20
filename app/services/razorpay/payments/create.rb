module Razorpay
	module Payments
		class Create

			def initialize(payment_hash, order)
				@payment_hash = JSON.parse(payment_hash)
				@order = order
			end

			def run
				create_razorpay_payment
				return true
			end

			private

			def create_razorpay_payment
				RazorpayTransaction.create(
					txn_id: payment_hash['id'], 
					txn_status: payment_hash['status'], 
					payment_hash: payment_hash, 
					amount: (payment_hash['amount']/100).to_f,
					email: payment_hash['email'],
					phone: payment_hash['contact'],
					order: order,
					mode: :razorpay
					)
			end

			attr_accessor :payment_hash, :order
		end
	end
end