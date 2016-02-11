module Spree::Content
  module Element
    class WidgetGroup < Group
      attribute :elements, WidgetSet
      attribute :template, String, default: :default_template

      def render(renderer, context, options={})
        options = options.dup
        if template.present?
          options[:html] ||= render_children(renderer, context, options)
          options[:layout] ||= template
          renderer.render(context, options)
        else
          render_children renderer, context, options
        end
      end
    end
  end
end
