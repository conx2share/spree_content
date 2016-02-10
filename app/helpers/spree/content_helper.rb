module Spree::ContentHelper
  def render_widget widget, options={}
    if widget
      resource = widget.instance.build_resource
      resource.renderer = controller.view_renderer
      resource.context = view_context_class.new(controller.view_renderer, controller.view_assigns.merge({ 'widget' => widget }), controller)
      resource.render options
    end
  end
end