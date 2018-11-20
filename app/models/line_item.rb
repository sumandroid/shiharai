class LineItem
  include Mongoid::Document
  include Mongoid::Timestamps
  include SimpleEnum::Mongoid
  include Mongoid::Attributes::Dynamic

  field :title, 		type: String
  field :amount,        type: Float

  #validations
  validates_presence_of :title, :amount
end
