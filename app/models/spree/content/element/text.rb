module Spree::Content
  module Element
    class Text < Base
      attribute :value, String
      attribute :max_length, Integer, default: 100

      validates_presence_of :value
    end
  end
end
