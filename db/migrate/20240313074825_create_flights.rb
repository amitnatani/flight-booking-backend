class CreateFlights < ActiveRecord::Migration[7.1]
  def change
    create_table :flights do |t|
      t.string          :source,          null: false
      t.string          :destination,     null: false
      t.datetime        :departure_time,  null: false
      t.datetime        :arrival_time,    null: false
      t.string          :flight_number,   null: false
      t.references      :airline,         null: false
      t.integer         :number_of_stops, default: 0, null: false
      t.decimal         :price,           null: false
      t.timestamps
    end

    add_index :flights, [:source, :destination, :departure_time, :arrival_time], name: 'flight_search_index'
  end
end
