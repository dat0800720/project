class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :max_member
      
      t.timestamps
    end
  end
end
