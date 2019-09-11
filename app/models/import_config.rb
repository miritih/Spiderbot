class ImportConfig < ApplicationRecord
  validates :job_title, :description, :job_link,
            presence: { message: I18n.t("validation.presence") }
end
