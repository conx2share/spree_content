module Spree::Content
  class InitializerProxy < BasicObject
    attr_reader :attributes

    def initialize
      @attributes = {}
    end

    def text(name, &block)
      attributes[:elements] ||= {}
      attributes[:elements] << ::Spree::Content::Element::Text.new(get_attrs(name, &block))
    end

    def image(name, &block)
      attributes[:elements] ||= {}
      attributes[:elements] << ::Spree::Content::Element::Image.new(get_attrs(name, &block))
    end

    def data(name, &block)
      attributes[:elements] ||= {}
      attributes[:elements] << ::Spree::Content::Element::Data.new(get_attrs(name, &block))
    end

    def image_group(name, &block)
      attributes[:elements] ||= {}
      attributes[:elements] << ::Spree::Content::Element::ImageGroup.new(get_attrs(name, &block))
    end

    def data_group(name, &block)
      attributes[:elements] ||= {}
      attributes[:elements] << ::Spree::Content::Element::DataGroup.new(get_attrs(name, &block))
    end

    def widget_group(name, &block)
      attributes[:elements] ||= {}
      attributes[:elements] << ::Spree::Content::Element::WidgetGroup.new(get_attrs(name, &block))
    end

    def method_missing(name, *args)
      attributes[name] = args.length == 1 ? args[0] : args
    end

    private

    def get_attrs(name, &block)
      initializer = ::Spree::Content::InitializerProxy.new
      initializer.instance_eval(&block) if block_given?

      initializer.attributes[:name] ||= name
      initializer.attributes
    end
  end
end
