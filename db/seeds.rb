# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Member.none?    
  50.times do |i|
    bithday = Date.today - rand(-1..10000)
    Member.create!(name: "Name#{i+1}", employee_code: "%04d" % i, sex: rand(0..1), bithday: bithday, nation: "Kinh", marriage: "FA", nationality: "Việt Nam", religion: "không", identity_card: rand(100000000..800000000),
    date_issued: bithday, issued_at: "Công an tỉnh Bắc Ninh", home_town: "Từ Sơn - Bắc Ninh", permanent_address: "125 thụy phương - Bắc Từ Niêm - Hà Nội", presenter: "Đàm Đức Đạt", license_plates: 123,
    vehicle_brand: "ware", vehicle_color: "vàng", phone_number: "0858651373", relatives_phone: "0858651373", current_address: "Địa chỉ hiện tại k rõ", bank_account:123, bank_name: "Bidv", work_status: rand(0..1), seniority: "seniority" )
  end
end

User.first.update!(
  name: 'admin',
  email: 'dat@gmail.com',
  password: '123456',
  password_confirmation: '123456',
  user_type: 1,
  status: 0
)
user = User.first
user.image.attach(io: File.open("/home/dat/project/app/assets/images/me.jpg"), filename: "me.jpg")

if Holiday.none?
  Holiday.create!(name: "Nghỉ cưới")
  Holiday.create!(name: "Nghỉ đám ma")
  Holiday.create!(name: "Nghỉ ốm")
  Holiday.create!(name: "nghỉ lễ")
  Holiday.create!(name: "Xin đến muộn")
  Holiday.create!(name: "Xin về sớm")
  Holiday.create!(name: "Xin nghỉ phép")
end

if Request.none?
  50.times do |i|
    Request.create!(member_id: rand(2..48), holiday_id: rand(1..7), content: "Nghỉ vì đam mê thôi chứ lý do là phụ thôi. vậy lên cảm giác duyệt được thì duyệt giúp nhanh không thì bị trừ lương chết toi", request_status: rand(0..3))
  end
end

50.times do |i|
  BreakTime.create!(request_id: i+1, start_time: Time.now, end_time: Time.now - rand(-10..0), day: Date.today - rand(-5..5))
end

(1..200).each do
  MemberRequest.create!(request_id: rand(1..50), member_id: rand(1..50), type_recipient: rand(0..1))
end
