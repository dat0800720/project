class Constant < ApplicationRecord

  STATUS = {
    0 => I18n.t("user.activate"),
    1 => I18n.t("user.lock")
  }

  SEX = {
    0 => I18n.t("member.male"),
    1 => I18n.t("member.female"),
    2 => I18n.t("member.is_different")
  }

  WORK_STATUS = {
    0 => I18n.t("member.working"),
    1 => I18n.t("member.quit_my_job")
  }

  REQUEST_STATUS = {
    0 => I18n.t("request.sent"),
    1 => I18n.t("request.draft"),
    2 => I18n.t("request.approved"),
    3 => I18n.t("request.disable")
  }
end
