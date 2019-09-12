class Employer < ApplicationRecord
  validates :name,
            :location,
            :employer_type,
            presence: { message: I18n.t("validation.presence") }
  validates :name, uniqueness: { message: I18n.t("validation.uniqueness") }
end
