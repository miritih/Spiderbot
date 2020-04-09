ActiveAdmin.register ImportConfig do

  permit_params :seed_click, :first_page, :second_page, :next_page, :job_count, :jobs_page_url, :home_page, :employer_override, :location_override, :config_name

  filter :id_equals, label: 'IC#'
  filter :config_name, filters: [:equals, :contains]
  filter :jobs_page_url
  filter :home_page

  # permit_params do
  #   permitted = [:seed_click, :first_page, :second_page, :next_page, :job_count, :jobs_page_url, :home_page, :employer_override, :location_override, :config_name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  objectss = {
      "JOB_TITLE" => "",
      "JOB_LOCATION" => "",
      "JOB_LISTING_URL" => "",
      "ID_FROM_SOURCE"  => "",
      "JOB_CITY" => "",
      "JOB_CATEGORY" => "",
      "JOB_EMPLOYER" => "",
      "JOB_TYPE" => "",
      "JOB_COMPENSATION" => "",
      "JOB_DESCRIPTION" => "",
      "APPLY_TO_EMAIL" =>  "",
      "EXPIRE_DATE" => "",
      "JOB_SOURCE_AD_TARGET" => "",
      "nextPageXpath" => "",
      "backToListings" => "",
    }

  index do
    # selectable_column
    column "IC#", sortable: :id do |config|
      auto_link(config, config.id)
    end
    column "Config Name", sortable: :config_name do |config|
      auto_link(config, config.config_name)
    end
    column :jobs_page_url
    column :home_page
  end

  form do |f|
    inputs do
      input :job_count
      input :config_name
      input :home_page
      input :employer_override
      input :location_override
      input :jobs_page_url
    end
    inputs  do
      columns do
        column do
          input :first_page, as: :jsonb
        end
        column do
          input :second_page, as: :jsonb
        end
      end
      columns do
        column do
          input :seed_click, as: :jsonb
        end
        column do
          input :next_page, as: :jsonb
        end
      end
      columns do
        column do
          f.li "<label class='label template'>Template</label><textarea id='template'>#{JSON.pretty_generate(objectss)}</textarea>".html_safe
        end
        column do end;
      end

    end
    actions
  end


end
