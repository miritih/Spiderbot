class Employer < ApplicationRecord
  validates :name,
            :location,
            :employer_type,
            presence: { message: I18n.t("validation.presence") }
  validates :name, uniqueness: { message: I18n.t("validation.uniqueness") }
  has_many :jobs, foreign_key: "job_employer",
                  dependent: :destroy, inverse_of: :employer
end
