module Spree::Content
  class ElementSet < Virtus::Attribute
    def coerce(elements)
      return if elements.nil?

      elements.map do |obj|
        if obj.is_a? Element::Base
          obj
        elsif klass = obj[:type] || obj['type']
          begin
            klass = klass.classify
            klass = 'Data' if klass == 'Datum'

            "Spree::Content::Element::#{klass}".constantize.new(obj)
          rescue Exception => e
            byebug
            raise
            #raise ArgumentError, "Problem constantizing :type for: #{klass}"
          end
        else
          byebug
          raise ArgumentError, "Serialized Element must contain :type attribute: #{obj}"
        end
      end
    end
  end
end
