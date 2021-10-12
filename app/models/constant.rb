class Constant < ApplicationRecord

  STATUS = {
    0 => "Hoạt động",
    1 => "Bị khóa"
  }

  SEX = {
    0 => "Nam",
    1 => "Nữ",
    2 => "Khác"
  }

  WORK_STATUS = {
    0 => "Đang làm việc",
    1 => "Đã thôi việc"
  }
end
