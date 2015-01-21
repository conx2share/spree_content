module Spree::Content
  module Widget
    class Base
      include Virtus.model
      include ActiveModel::Validations
      include ActiveModel::Conversion
      extend ActiveModel::Naming

      #attribute :id, BSON::ObjectId, default: Proc.new { BSON::ObjectId.new.to_s }
      attribute :name, String

      attribute :elements, ElementSet

      @@definitions = []
      cattr_accessor :definitions

      def elements
        if @elements.nil?
          @elements = self.class.definitions.map(&:dup)
        else
          @elements
        end
      end

      def self.descendants
        ObjectSpace.each_object(Class).select { |klass| klass < self }
      end

      validates_presence_of :id, :name

      def persisted?
        true
      end

      def hashify
        self.attributes.merge elements: elements.map(&:hashify),
                              type: self.class.to_s.split('::').last.tableize.singularize
      end

      def build_resource
        resource = Resource.new
        resource.name = "New #{self.name}"
        resource.layout_id = self.id

        elements.each do |element|
          resource.elements << element.clone
        end

        resource
      end

      def index_attributes
        []
      end
    end
  end
end
