class SetUpSpreeRelatable < ActiveRecord::Migration
  def change
    create_table :spree_relation_types do |t|
      t.string :name
      t.text :description
      t.string :applies_to
      t.timestamps
    end

    create_table :spree_relations, force: true do |t|
      t.references :relation_type
      t.references :relatable, polymorphic: true
      t.references :related_to, polymorphic: true
      t.integer :position
      t.decimal :discount_amount, precision: 8, scale: 2, default: 0.0
      t.timestamps
    end
  end
end
