class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :id_per_days, null: false
      t.date :target, null: false
      t.string :name, null: false
      t.integer :priority
      t.belongs_to :category, index: true
      t.float :estimate_hour
      t.datetime :started_at
      t.datetime :finished_at

      t.timestamps null: false
    end
  end
end
