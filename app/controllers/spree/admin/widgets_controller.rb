module Spree
  module Admin
    class WidgetsController < Spree::Admin::BaseController
      def index
        @widgets = Spree::Widget.all
      end

      def edit
        @widget = Spree::Widget.find(params[:id])
      end

      def new
        @widget = Spree::Widget.new
        @widget.instance = Spree::Content::Widget::Slide.new
      end

      def create
        #TODO: VALIDATE
        @widget = Spree::Widget.create widget_params
        #TODO: handle my fail
        redirect_to admin_widgets_path
      end

      def update
        #TODO: VALIDATE
        @widget = Spree::Widget.find(params[:id])
        @widget.update_attributes widget_params
        #TODO: handle my fail
        redirect_to admin_widgets_path
      end


      private

      def widget_params
        params.require(:widget).permit(:name, :value, :klass)
      end
    end
  end
end
