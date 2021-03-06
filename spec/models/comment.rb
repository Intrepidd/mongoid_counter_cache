require 'mongoid'
require 'mongoid_countercache'

class Comment
  include Mongoid::Document
  include Mongoid::CounterCache

  belongs_to :post

  field :mark, :type => Integer, :default => 5

  counter_cache :post, :variants => {
    :positive => lambda { mark > 8},
    :negative => lambda { mark < 3}
  }

  counter_cache :post, :field_name => 'custom_field_name'
end
