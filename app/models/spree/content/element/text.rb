module Spree::Content
  module Element
    class Text < Base
      attribute :value, String

      validates_presence_of :value
    end
  end
end
