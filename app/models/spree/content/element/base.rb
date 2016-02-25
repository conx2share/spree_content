module Spree::Content
  module Element
    class Base
      include Virtus.model
      include ActiveModel::Validations
      include ActiveModel::Conversion
      extend ActiveModel::Naming

      attribute :id, BSON::ObjectId, default: Proc.new { BSON::ObjectId.new.to_s }
      attribute :name, String
      attribute :required, Boolean, default: false
      attribute :language, String, default: 'en-US'

      attribute :engine, Symbol, default: :erubis
      attribute :template, String, default: :default_template

      def persisted?
        true
      end

      def find(name)
        if self.name == name
          self
        elsif self.is_a? Element::Group
          self.elements.detect do |element|
            element.find(name)
          end
        end
      end

      def type
        klass.tableize.singularize
      end

      def hashify
        self.attributes.merge type: type
      end

      def render(renderer, context, options={})
        old_element = nil
        if template.present?
          options = options.dup
          options[:template] ||= template
          old_element = context.instance_variable_get(:element) if context.instance_variable_defined?(:element)
          context.assign({ element: self })
          renderer.render(context, options)
        end
      ensure
        context.assign({ element: old_element })
      end

      private

      def default_template
        "widgets/#{klass.downcase}"
      end

      def klass
        @_klass ||= self.class.to_s.split('::').last
      end
    end
  end
end
