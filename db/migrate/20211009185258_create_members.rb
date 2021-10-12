class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.references :user, null: false, foreign_key: true
      t.string :employee_code
      t.string :name
      t.integer :sex
      t.date :bithday
      t.string :nation
      t.string :marriage
      t.string :nationality
      t.string :religion
      t.string :identity_card
      t.date :date_issued
      t.string :issued_at
      t.string :home_town
      t.string :permanent_address
      t.string :presenter
      t.integer :license_plates
      t.string :vehicle_brand
      t.string :vehicle_color
      t.string :phone_number
      t.string :relatives_phone
      t.string :current_address
      t.integer :bank_account
      t.string :bank_name
      t.integer :work_status
      t.string :seniority

      t.timestamps
    end
  end
end
