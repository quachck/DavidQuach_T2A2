class AddPriceToWorkshops < ActiveRecord::Migration[7.0]
  def change
    add_column :workshops, :price, :decimal
  end
end
