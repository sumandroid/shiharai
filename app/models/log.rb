class Log
  include Mongoid::Document
  include Mongoid::Timestamps

  field :text_content,    type: String
  field :action_type,     type: String, default: ''
end
