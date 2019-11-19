class Job < ApplicationRecord
  validates :job_title,
            :job_location,
            presence: { message: I18n.t("validation.presence") }
end
