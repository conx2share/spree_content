module Spree::Content
  module Element
    class Group < Base
      attribute :elements, ElementSet, default: []
      attribute :min_children, Integer, default: 0
      attribute :max_children, Integer

      def hashify
        byebug if elements.nil?
        self.attributes.merge elements: elements.map(&:hashify), type: type
      end

      def render
        if template.present?
          super
        else
          render_children
        end
      end

      def render_children
        self.elements.map(&:render).join "\n"
      end
    end
  end
end
