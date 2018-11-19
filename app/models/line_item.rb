class LineItem
  include Mongoid::Document
  include Mongoid::Timestamps
  include SimpleEnum::Mongoid
  include Mongoid::Attributes::Dynamic

  #relations
  belongs_to :order

  field :title, 		type: String,
  field :amount,        type: Float
end
