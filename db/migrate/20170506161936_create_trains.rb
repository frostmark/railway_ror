class CreateTrains < ActiveRecord::Migration[5.1]
  def change
    create_table :trains do |t|
      t.string :number
      t.belongs_to :current_station
      
      t.timestamps
    end
  end
end
