class AddColumnToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :guest_rating, :integer
  end
end
