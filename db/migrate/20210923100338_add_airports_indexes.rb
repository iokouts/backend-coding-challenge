class AddAirportsIndexes < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_index :airports, :passenger_volume, algorithm: :concurrently
    add_index :airports, :country_alpha2, algorithm: :concurrently
  end
end
