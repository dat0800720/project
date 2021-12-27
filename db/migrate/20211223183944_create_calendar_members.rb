class CreateCalendarMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :calendar_members do |t|
      t.references :member, null: false, foreign_key: true
      t.references :calendar, null: false, foreign_key: true

      t.timestamps
    end
  end
end
