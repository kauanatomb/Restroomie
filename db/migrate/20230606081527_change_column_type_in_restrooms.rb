class ChangeColumnTypeInRestrooms < ActiveRecord::Migration[7.0]
  def change
    change_column :restrooms, :pricing, :decimal, precision: 10, scale: 2
  end
end
