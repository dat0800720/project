module ApplicationHelper
  include Pagy::Frontend

  def select_type select_i18n
    I18n.t("#{select_i18n}").map{ |key, value| [value, key] }
  end
end
