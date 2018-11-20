class OrderLineItem < LineItem
  include Mongoid::Document
  include Mongoid::Timestamps
  include SimpleEnum::Mongoid
  include Mongoid::Attributes::Dynamic

  #relations
  belongs_to :order
end
