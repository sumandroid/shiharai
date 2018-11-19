class LineItem
  include Mongoid::Document
  include Mongoid::Timestamps
  include SimpleEnum::Mongoid
  include Mongoid::Attributes::Dynamic

  #relations
  belongs_to :order, optional: true

  field :title, 		type: String
  field :amount,        type: Float

  #validations
  validates_presence_of :title, :amount
end
