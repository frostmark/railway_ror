class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.string :name, nil: false

      t.timestamps
    end
  end
end