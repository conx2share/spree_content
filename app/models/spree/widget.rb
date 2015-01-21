module Spree
  class Widget < ActiveRecord::Base
    attr_writer :instance

    def instance
      @instance ||= Spree::Content::Widget::Slide.new(YAML.load(self.value))
    end
  end
end
