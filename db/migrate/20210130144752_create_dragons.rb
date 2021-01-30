class CreateDragons < ActiveRecord::Migration[6.0]
  def change
    create_table :dragons do |t|
      t.string :nickname
      t.string :country
      t.string :size
      t.string :speed
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
