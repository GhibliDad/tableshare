class ChangeOpenToFalseInEvents < ActiveRecord::Migration[6.0]
  def change
    change_column :events, :open, :boolean, default: false
  end
end
