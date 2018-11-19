class Order
  include Mongoid::Document
  include Mongoid::Timestamps
  include SimpleEnum::Mongoid
  include Mongoid::Attributes::Dynamic

  #relations
  has_many :transactions
  has_many :line_items


  #fields
  field :total_amount, 		type: Float
  field :amount_paid,       type: Float,    default: 0
end
