module Spree::Content
  module Element
    class DataGroup < Group
      attribute :elements, ElementSet

      validates_each :elements do |record, attr, value|
        value.each do |v|
          record.errors.add attr, ' must all be of type Element::Data' unless v.is_a? Element::Data
          record.errors.add attr, v.errors.full_messages if v.invalid?
        end
      end
    end
  end
end
