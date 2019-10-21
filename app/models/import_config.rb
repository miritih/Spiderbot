class ImportConfig < ApplicationRecord
  validates :job_title, :description, :employer, :start_url, :job_link,
            presence: { message: I18n.t("validation.presence") }
end
