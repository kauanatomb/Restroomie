class AddNewColumnToRestrooms < ActiveRecord::Migration[7.0]
  def change
    add_column :restrooms, :approved, :boolean, default: false
  end
end
