module Spree::Content
  module Element
    class WidgetGroup < Group
      attribute :elements, WidgetSet

    end
  end
end
