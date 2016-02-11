module Spree
  class Widget < ActiveRecord::Base
    serialize :value

    attr_writer :instance

    def instance
      @instance ||= Spree::Content::Widget::const_get(value[:type].classify).new(value) if value.has_key? :type
    end
  end
end
