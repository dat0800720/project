class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.references :member, null: false, foreign_key: true
      t.references :holiday, null: false, foreign_key: true
      t.string :content
      t.integer :request_status

      t.timestamps
    end
  end
end
