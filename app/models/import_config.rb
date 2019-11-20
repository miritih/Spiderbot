class ImportConfig < ApplicationRecord
  validates :first_page, :jobs_page_url, :home_page, :config_name,
            presence: { message: I18n.t("validation.presence") }
end
