class CreateRegions < ActiveRecord::Migration[6.0]
  def change
    create_table :regions do |t|
      t.integer "region_id"
      t.string  "region_number"
      t.string  "area"
      t.string  "description"
    end
  end
end
