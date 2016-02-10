module Spree::Content
  class Resource
    include Virtus.model
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming

    attribute :id, BSO::ObjectId, default: Proc.new { BSON::ObjectId.new.to_s }
    attribute :name, String
    attribute :slug, String
    attribute :layout_id, String

    attribute :elements, ElementSet, default: []

    validates_presence_of :id, :name

    def persisted?
      true
    end

    def valid?
      validate(self.elements)
    end

    def hashify
      self.attributes.merge elements: elements.map(&:hashify), type: type
    end

    def type
      self.class.to_s.split('::').last.tableize.singularize
    end

    def render
      self.elements.map(&:render).join "\n"
    end

    def index_attributes
      [:slug]
    end

    private

    def validate(elements)
      if elements.is_a? Array
        elements.all? do |element|
          validate(element)
        end
      else
        elements.required ? elements.valid? : true
      end
    end
  end
end
