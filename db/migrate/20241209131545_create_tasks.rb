class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.references :board, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
