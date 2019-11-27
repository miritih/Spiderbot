class JobSerializer
  include FastJsonapi::ObjectSerializer
  attributes :job_type, :id_from_source, :job_city, :job_category,
              :job_compensation,
              :expire_date,
              :job_employer,
              :job_listing_url,
              :job_location,
              :apply_to_email,
              :job_description,
              :job_source_ad_target,
              :job_state,
              :job_country,
              :job_date,
              :postal_code,
              :job_title
end
