module Spree::Content
  module Element
    class Image < Base
      attribute :src, String
      attribute :alt, String

      validates_presence_of :src
    end
  end
end
