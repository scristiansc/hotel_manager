class ChangeNullConstrainOnHotels < ActiveRecord::Migration[8.0]
  def change
    change_column_null :hotels, :name, false
    change_column_null :hotels, :address, false
    change_column_null :hotels, :rating, false
  end
end
