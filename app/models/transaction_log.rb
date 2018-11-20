class TransactionLog < Log
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic
  include SimpleEnum::Mongoid


  as_enum :transaction_status,
  	success: 0,
  	failed: 1,
  	authorized: 2


 #relations
 belongs_to :razorpay_transaction, optional: true 	 
 belongs_to :mobikwik_transaction, optional: true 	 	

end
	