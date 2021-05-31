class AddColumsToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :food_rating, :integer
    add_column :reviews, :host_rating, :integer
    add_column :reviews, :vibe_rating, :integer
    add_column :reviews, :total_rating, :float
  end
end
