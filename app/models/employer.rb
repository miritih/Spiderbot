# frozen_string_literal: true

class Employer < ApplicationRecord
  validates :name,
            :location,
            :employer_type,
            presence: { message: I18n.t('employer.presence') }
  validates :name, uniqueness: { message: I18n.t('employer.uniqueness') }
end
