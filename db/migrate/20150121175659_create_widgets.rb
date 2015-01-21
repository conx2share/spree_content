class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :spree_widgets do |t|
      t.string :name
      t.string :klass
      t.text   :value
      t.timestamps
    end
  end
end
