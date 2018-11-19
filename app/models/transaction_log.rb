class TransactionLog < Log
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic
  include SimpleEnum::Mongoid


  as_enum :transaction_status,
  	successful: 0,
  	failed: 1


 #relations
 belongs_to :razorpay_transaction
 belongs_to :mobikwik_transaction 	 	

end
	