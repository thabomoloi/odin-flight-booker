class RenameDapartureTimeToDepartureTime < ActiveRecord::Migration[7.1]
  def change
    rename_column :flights, :daparture_time, :departure_time
  end
end
