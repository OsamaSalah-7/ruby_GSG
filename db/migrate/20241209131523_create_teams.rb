class CreateTeams < ActiveRecord::Migration[8.0]
  def change
    create_table :teams do |t|
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
