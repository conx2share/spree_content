module Spree::Content
  class InitializerProxy < BasicObject
    def initialize
      @attributes = {}
    end

    attr_reader :attributes

    def method_missing(name, *args)
      attributes[name] = args.length == 1 ? args[0] : args
    end
  end
end
