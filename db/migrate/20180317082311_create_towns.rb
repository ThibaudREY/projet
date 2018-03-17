class CreateTowns < ActiveRecord::Migration
  def change
    create_table :towns do |t|
      t.string :city
      t.string :postcode
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
