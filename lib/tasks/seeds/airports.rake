require 'csv'
require 'json'
require 'countries'

namespace :seeds do
  desc 'seed airport data from openflights.org'
  task :airports, %i[country_column_name] => :environment do |_, args|
    raise :airport_model_not_found unless defined?(Airport)

    country_column_name = args.country_column_name || 'country'
    data_sets           = read_static_files_airports(country_column_name)
    timestamps          = { created_at: Time.current, updated_at: Time.current }

    # rubocop:disable Style/MultiLineBlockChain
    Airport.insert_all(
      data_sets[:openflight_csv].map do |row|
        row.to_h
            .map { |k, v| [k, v == '\\N' ? nil : v] }.to_h
            .with_indifferent_access
            .merge(timestamps)
            .merge(passenger_volume: data_sets[:passenger_volumes_csv].find { |fixup_row| fixup_row['IATA'] == row['iata'] }.to_h['Passengers']&.to_i)
            .merge(country_alpha2: ISO3166::Country.find_country_by_name(row['country']).try(:alpha2))
            .slice(*Airport.column_names)
      end.uniq { |row| row[:uid] },
    )
    # rubocop:enable Style/MultiLineBlockChain

    puts "imported #{Airport.count} airports"

    :done
  end

  # @NOTE: we should not overwrite the `country_column_name` because the openflight dataaset contains the country-name
  #        and we might have already overwritten that into the country's ISO code using `lhrake:seeds:link_airports_to_countries`
  def read_static_files_airports(country_column_name = 'country')
    # rubocop:disable Layout/LineLength
    openflight_data   = File.expand_path(File.join(File.dirname(__FILE__), 'data', 'openflight', 'airports.dat'))
    passenger_volumes = File.expand_path(File.join(File.dirname(__FILE__), 'data', 'airports_by_passengers.csv'))
    headers           = %("uid","name","city","#{country_column_name}","iata","icao","latitude","longitude","altitude","timezone","dst","timezone_olson","kind","source"\n)
    # rubocop:enable Layout/LineLength

    openflight_csv = ''
    openflight_csv << headers
    openflight_csv << File.read(openflight_data)
    openflight_csv = CSV.parse(openflight_csv.gsub('\"', '""'), headers: true)

    passenger_volumes_csv = File.read(passenger_volumes)
    passenger_volumes_csv = CSV.parse(passenger_volumes_csv.gsub('\"', '""'), headers: true)

    {
      headers: headers,
      openflight_csv: openflight_csv,
      passenger_volumes_csv: passenger_volumes_csv,
    }
  end
end
