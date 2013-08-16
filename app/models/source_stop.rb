class SourceStop < ActiveRecord::Base
  attr_accessible :stop_id,
                  :external_stop_id,
                  :source_id, 
                  :external_lat,
                  :external_lon,
                  :external_stop_name,
                  :external_stop_desc,
                  :external_zone_id,
                  :external_stop_url,
                  :external_stop_timezone,
                  :external_wheelchair_boarding, 
                  :external_stop_street,
                  :external_stop_city,
                  :external_stop_region,
                  :external_stop_postcode, 
                  :external_stop_country

# after_save: some_method

# def some_method

# end

end