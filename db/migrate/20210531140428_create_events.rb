class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :address
      t.text :ingredients
      t.datetime :start
      t.datetime :end
      t.text :description
      t.integer :available_seats
      t.references :user, null: false, foreign_key: true
      t.boolean :private
      t.boolean :open

      t.timestamps
    end
  end
end
