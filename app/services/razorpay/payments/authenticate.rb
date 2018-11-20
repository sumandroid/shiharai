module Razorpay
  module Payments
    class Authenticate

      require 'razorpay'

      def initialize(payment_id, line_item_id = nil)
        @payment_id = payment_id
        @line_item_id = line_item_id
      end

      def run
        make_auth_request_to_razorpay
        if payment_is_valid?
          return razorpay_response
        else
          return false
        end
      end


      private

      def make_auth_request_to_razorpay
        @razorpay_response = Razorpay::Payment.fetch(payment_id)
      end

      def payment_is_valid?
        payment_status = razorpay_response.attributes['status']
        error_code = razorpay_response.attributes['error_code']
        if error_code.nil?
          line_item = LineItem.where(id: line_item_id).first
          if line_item.present? && line_item.amount.to_f == (razorpay_response.attributes['amount']/100).to_f #to check with the tampering of amount or line_item
        	return true
    	end
      end
        return false
    end

    attr_accessor :payment_id, :payment_hash, :razorpay_response, :line_item_id
  end
end
end
