module Spree::Content
  class WidgetType
    def self.define(name, &block)
      definition_proxy = DefinitionProxy.new(name)
      definition_proxy.instance_eval(&block)
    end
  end
end
