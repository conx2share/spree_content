module Spree::Content
  module Element
    class ImageGroup < Group
      attribute :elements, ElementSet

      validates_each :fields do |record, attr, value|
        value.each do |v|
          record.errors.add attr, ' must all be of type Element::Image' unless v.is_a? Element::Image
          record.errors.add attr, v.errors.full_messages if v.invalid?
        end
      end
    end
  end
end
