class AddTypeToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :type, :string
  end
end
