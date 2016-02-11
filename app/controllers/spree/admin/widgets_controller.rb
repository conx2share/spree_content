module Spree
  module Admin
    class WidgetsController < Spree::Admin::BaseController
      def index
        @widgets = Spree::Widget.all
      end

      def edit
        @widget = Spree::Widget.find(params[:id])
        @widget.value = @widget.instance.hashify.to_yaml
      end

      def new
        @widget = Spree::Widget.new
        @widget_types = Spree::Content::Widget::Base.descendants
      end

      def create
        @widget = Spree::Widget.new widget_params
        @widget.value = Spree::Content::Widget::const_get(widget_params[:klass].classify).new.hashify

        if @widget.save
          redirect_to edit_admin_widget_path(@widget)
        else
          render :new
        end
      end

      def update
        @widget = Spree::Widget.find(params[:id])
        current_instance = @widget.instance.hashify
        widget_params[:value] = YAML.load(widget_params[:value])
        if @widget.update_attributes widget_params
          redirect_to admin_widgets_path
        else
          @widget.value = current_instance.merge(@widget.value).to_yaml
          render :edit
        end
      end


      private

      def widget_params
        @widget_params ||= params.require(:widget).permit(:name, :value, :klass)
      end
    end
  end
end
