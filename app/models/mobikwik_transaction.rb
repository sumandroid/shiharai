class MobikwikTransaction < Transaction
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic


  #relations 
  has_many :transaction_logs
end
