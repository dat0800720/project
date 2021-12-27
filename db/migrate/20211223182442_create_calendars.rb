class CreateCalendars < ActiveRecord::Migration[6.0]
  def change
    create_table :calendars do |t|
      t.references :room, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true
      t.string :title
      t.string :content
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
