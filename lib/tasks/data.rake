task :load_metro_transit_stops => :environment do
  require 'csv'
  require 'zip/zipfilesystem'
  # SourceStop.delete_all
  
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
    # Stop.create!(row.to_hash)
    # raise row.to_yaml

    SourceStop.find_or_initialize_by_source_id_and_external_stop_id(1, row[0]) do |stop|
      # raise stop.to_yaml
      # stop.update_attributes(

      # )
      stop.external_lat = row[3],
      stop.external_lon = row[4],
      stop.external_stop_name = row[1],
      stop.external_stop_desc = row[2],
      stop.external_zone_id = row[10],
      stop.external_stop_url = row[11],
      stop.external_stop_street = row[5],
      stop.external_stop_city = row[6],
      stop.external_stop_region = row[7],
      stop.external_stop_postcode = row[8], 
      stop.external_stop_country = row[9]
      stop.save!
    end

    # SourceStop.create_or_create_by_source_id_and_external_stop_id!({
    #   source_id: 1, # msp_gtfs
    #   external_stop_id: row[0],
    #   external_lat: row[3],
    #   external_lon: row[4],
    #   external_stop_name: row[1],
    #   external_stop_desc: row[2],
    #   external_zone_id: row[10],
    #   external_stop_url: row[11],
    #   external_stop_street: row[5],
    #   external_stop_city: row[6],
    #   external_stop_region: row[7],
    #   external_stop_postcode: row[8], 
    #   external_stop_country: row[9]
    # })
  end
end