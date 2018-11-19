class Transaction

  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic
  include SimpleEnum::Mongoid

  field :amount,                      type: Float
  field :mode,                        type: String
  field :txnStatus,                   type: String
  field :email,                       type: String
  field :mobile,                      type: String

  as_enum :mode,
    razorpay: 0,
    mobikwik: 1

  #validations  
  validates_presence_of :amount, :mode

  #relations
  belongs_to :order

  accepts_nested_attributes_for :order

end
