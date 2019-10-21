class Job < ApplicationRecord
  validates :title,
            :location,
            presence: { message: I18n.t("validation.presence") }
  belongs_to :employer
end
