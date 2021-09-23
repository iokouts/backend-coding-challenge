# == Schema Information
#
# Table name: airports
#
#  id               :uuid             not null, primary key
#  altitude         :integer
#  city             :string
#  country          :string
#  country_alpha2   :string
#  dst              :string
#  iata             :string
#  icao             :string
#  kind             :string
#  latitude         :decimal(10, 6)
#  longitude        :decimal(10, 6)
#  name             :string
#  passenger_volume :integer
#  source           :string
#  timezone         :string
#  timezone_olson   :string
#  uid              :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_airports_on_country_alpha2          (country_alpha2)
#  index_airports_on_iata                    (iata) UNIQUE
#  index_airports_on_iata_and_icao_and_name  (iata,icao,name)
#  index_airports_on_icao                    (icao)
#  index_airports_on_name                    (name)
#  index_airports_on_passenger_volume        (passenger_volume)
#
FactoryBot.define do
  factory :airport do
    fra
    kind { 'airport' }
    source { 'OurAirports' }
    created_at { Time.current }
    updated_at { Time.current }

    trait :fra do
      name { 'Frankfurt Airport' }
      city { 'Frankfurt' }
      country { 'Germany' }
      country_alpha2 { 'DE' }
      iata { 'FRA' }
      icao { 'EDDF' }
      latitude { 50.033333 }
      longitude { 8.570556 }
      altitude { 364 }
      timezone { '1' }
      dst { 'E' }
      timezone_olson { 'Europe/Berlin' }
      passenger_volume { 5000000 }
    end

    trait :muc do
      name { 'Munich Airport' }
      city { 'Munich' }
      country { 'Germany' }
      country_alpha2 { 'DE' }
      iata { 'MUC' }
      icao { 'EDDM' }
      latitude { 48.353802 }
      longitude { 11.7861 }
      altitude { 1487 }
      timezone { '1' }
      dst { 'E' }
      timezone_olson { 'Europe/Berlin' }
      passenger_volume { 6000000 }
    end

    trait :zrh do
      name { 'Zurich Airport' }
      city { 'Zurich' }
      country { 'Switzerland' }
      country_alpha2 { 'CH' }
      iata { 'ZRH' }
      icao { 'LSZH' }
      latitude { 47.464699 }
      longitude { 8.54917 }
      altitude { 1416 }
      timezone { '1' }
      dst { 'E' }
      timezone_olson { 'Europe/Zurich' }
      passenger_volume { 1000000 }
    end

    trait :vie do
      name { 'Vienna International Airport' }
      city { 'Vienna' }
      country { 'Austria' }
      country_alpha2 { 'AT' }
      iata { 'VIE' }
      icao { 'LOWW' }
      latitude { 48.110298 }
      longitude { 16.5697 }
      altitude { 600 }
      timezone { '1' }
      dst { 'E' }
      timezone_olson { 'Europe/Vienna' }
      passenger_volume { 7000000 }
    end

    trait :inn do
      name { 'Innsbruck Airport' }
      city { 'Innsbruck' }
      country { 'Austria' }
      country_alpha2 { 'AT' }
      iata { 'INN' }
      icao { 'LOWI' }
      latitude { 47.260201 }
      longitude { 11.344 }
      altitude { 1907 }
      timezone { '1' }
      dst { 'E' }
      timezone_olson { 'Europe/Vienna' }
    end

    trait :grz do
      name { 'Graz Airport' }
      city { 'Graz' }
      country { 'Austria' }
      country_alpha2 { 'AT' }
      iata { 'GRZ' }
      icao { 'LOWG' }
      latitude { 46.9911 }
      longitude { 15.4396 }
      altitude { 1115 }
      timezone { '1' }
      dst { 'E' }
      timezone_olson { 'Europe/Vienna' }
    end
  end
end
