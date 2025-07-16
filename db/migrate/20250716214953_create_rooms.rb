class CreateRooms < ActiveRecord::Migration[8.0]
  def change
    create_table :rooms do |t|
      t.string :room_number, null:false
      t.string :room_type, null:false
      t.integer :price, null:false
      t.references :hotel, foreign_key: true
      t.timestamps
    end
  end
end
