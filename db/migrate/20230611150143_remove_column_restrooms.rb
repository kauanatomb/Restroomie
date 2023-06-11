class RemoveColumnRestrooms < ActiveRecord::Migration[7.0]
  def change
    remove_column :restrooms, :hygiene_products
    remove_column :restrooms, :cleanliness
    add_column :restrooms, :opening_time, :time
    add_column :restrooms, :closing_time, :time
  end
end
