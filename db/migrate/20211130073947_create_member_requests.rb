class CreateMemberRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :member_requests do |t|
      t.references :request, foreign_key: { to_table: :requests }
      t.references :member, foreign_key: { to_table: :members }
      t.integer :type_recipient
      
      t.timestamps
    end
  end
end
