class ImportConfig < ApplicationRecord
  validates :job_title, :description, :job_link, presence: true
  
end
