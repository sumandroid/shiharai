class OrderLineItem
  include Mongoid::Document
  include Mongoid::Timestamps
  include SimpleEnum::Mongoid
  include Mongoid::Attributes::Dynamic

  #fields
  field :title, 		type: String
  field :amount,        type: Float

  #relations
  belongs_to :order
end
