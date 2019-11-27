class EmployerSerializer
  include FastJsonapi::ObjectSerializer
  has_many :jobs, foreign_key: "job_employer",
                  dependent: :destroy, inverse_of: :employer
  attributes :name, :location, :employer_type, :sector
end
