class CreateBreakTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :break_times do |t|
      t.references :request, null: false, foreign_key: true
      t.time :start_time
      t.time :end_time
      t.date :day

      t.timestamps
    end
  end
end
