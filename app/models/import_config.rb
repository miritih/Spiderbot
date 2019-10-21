class ImportConfig < ApplicationRecord
  validates :first_page, :jobs_page_url, :home_page,
            presence: { message: I18n.t("validation.presence") }
end
