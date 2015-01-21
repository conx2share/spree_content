module Spree::Content
  class WidgetSet < Virtus::Attribute
    def coerce(widgets)
      return if widgets.nil?

      widgets.map do |widget|
        if widget.is_a? Widget::Base
          widget
        elsif klass = widget[:type] || widget['type']
          begin
            klass = klass.classify
            klass = 'Data' if klass == 'Datum'

            "Spree::Content::Widget::#{klass}".constantize.new(obj)
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
