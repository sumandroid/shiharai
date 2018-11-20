class Log
  include Mongoid::Document
  include Mongoid::Timestamps

  field :text_content,    type: String
 
end
