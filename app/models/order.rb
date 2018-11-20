class Order
  include Mongoid::Document
  include Mongoid::Timestamps
  include SimpleEnum::Mongoid
  include Mongoid::Attributes::Dynamic

  #relations
  has_many :transactions
  has_many :order_line_items
  belongs_to :user


  #fields
  field :total_amount, 		type: Float
  field :amount_paid,       type: Float,    default: 0

  accepts_nested_attributes_for :order_line_items
end
