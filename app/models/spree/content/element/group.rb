module Spree::Content
  module Element
    class Group < Base
      attribute :elements, ElementSet, default: []
      attribute :min_children, Integer, default: 0
      attribute :max_children, Integer
      attribute :template, String, default: nil

      def hashify
        hash = self.attributes.dup
        hash[:elements] ||= []
        hash[:elements] = hash[:elements].map(&:hashify)
        hash[:type] = type
        hash
      end

      def render(renderer, context, options={})
        if template.present?
          super
        else
          render_children renderer, context, options
        end
      end

      def render_children(renderer, context, options={})
        self.elements.map{ |e| e.render renderer, context, options}.join("\n").html_safe
      end
    end
  end
end
