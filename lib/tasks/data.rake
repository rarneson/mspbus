task :load_metro_transit_stops => :environment do
  require 'csv'
  require 'zip/zipfilesystem'
  
  # download from http://www.gtfs-data-exchange.com/agency/metro-transit/
  # extract setup/msp_gtfs.zip into it's own diretory to prepare for import
  Zip::ZipFile.open("setup/msp_gtfs.zip") do |zip_file|
    zip_file.each { |f|
     destination = 'setup/msp_gtfs'
     f_path=File.join(destination, f.name)
     FileUtils.mkdir_p(File.dirname(f_path))
     zip_file.extract(f, f_path) unless File.exist?(f_path)
   }
  end

  # disable mass assignment restrictions
  SourceStop.send(:attr_protected)

  csv = CSV.parse(File.read(Rails.root.join('setup/msp_gtfs', 'stops.txt')), headers: true) do |row|
    stop = SourceStop.find_or_initialize_by_source_id_and_external_stop_id(1, row[0])

    stop.external_lat = row['stop_lat']
    stop.external_lon = row['stop_lon']
    stop.external_stop_name = row['stop_name']
    stop.external_stop_desc = row['stop_desc']
    stop.external_zone_id = row['zone_id']
    stop.external_stop_url = row['stop_url']
    stop.external_stop_street = row['stop_street']
    stop.external_stop_city = row['stop_city']
    stop.external_stop_region = row['stop_region']
    stop.external_stop_postcode = row['stop_postcode']
    stop.external_stop_country = row['stop_country']

    stop.save!
  end
end