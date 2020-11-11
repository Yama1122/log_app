class AddcolumnTouser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :gender_id, :integer
    add_column :users, :age_id, :integer
  end
end
