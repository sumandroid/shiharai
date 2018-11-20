class MobikwikTransaction < Transaction
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  field :txn_id,          type: String
  field :txn_status,      type: String
  field :payment_hash,    type: Hash

  #relations
  has_many :transaction_logs

  #callbacks
  after_create :create_log


  private

  def create_log
    transaction_logs.create(transaction_status: txn_status.to_sym, text_content: "Transaction #{txn_status} for amount: #{amount}, Txn_ID: #{txn_id}, via: Mobikwik")
  end
end
