class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :number, null: false
      t.string :name, null: false
      t.string :color

      t.timestamps null: false
    end
  end
end
