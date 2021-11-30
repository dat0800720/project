# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if User.none?
  user = User.create!(
    name: 'admin',
    email: 'dat@gmail.com',
    password: '123456',
    password_confirmation: '123456',
    user_type: 1,
    status: 0
  )
  user.image.attach(io: File.open("/home/dat/project/app/assets/images/me.jpg"), filename: "me.jpg")

  if Member.none?
    50.times do |i|
      bithday = Date.today - rand(-5..5)
      Member.create!(name: "Name#{i}", employee_code: "%04d" % i, sex: 1, bithday: bithday, nation: "Kinh", marriage: "FA", nationality: "Việt Nam", religion: "không", identity_card: 123456789101, date_issued: bithday, issued_at: "Công an tỉnh Bắc Ninh", home_town: "Từ Sơn - Bắc Ninh", permanent_address: "125 thụy phương - Bắc Từ Niêm - Hà Nội", presenter: "Đàm Đức Đạt", license_plates: 123, vehicle_brand: "ware", vehicle_color: "vàng", phone_number: "0858651373", relatives_phone: "0858651373", current_address: "current_address", bank_account:123, bank_name: "bank_name", work_status: 1, seniority: "seniority" )
    end
  end
  if Holiday.none?
    Holiday.create!(name: "Nghỉ cưới")
    Holiday.create!(name: "Nghỉ đám ma")
    Holiday.create!(name: "Nghỉ ốm")
    Holiday.create!(name: "nghỉ lễ")
    Holiday.create!(name: "khác")
  end
  if Request.none?
    Request.create!(member_id: 20, holiday_id: 2, content: "dam me", request_status: 0)
  end
end
