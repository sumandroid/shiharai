class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  #fields
  field :name,       type: String
  field :email,      type: String
  field :phone,      type: Integer


  #validations
  validates_presence_of :name, :email, :phone

  #relations
  has_many :orders
  
end
