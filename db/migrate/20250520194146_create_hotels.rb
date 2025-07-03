class CreateHotels < ActiveRecord::Migration[8.0]
  def change
    create_table :hotels do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.integer :rating, null: false

      t.timestamps
    end
  end
end
