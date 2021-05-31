class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :heading
      t.text :content
      t.references :reservation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
