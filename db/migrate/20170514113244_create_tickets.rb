class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.belongs_to :train
      t.belongs_to :user
      t.belongs_to :start_station
      t.belongs_to :end_station
      t.belongs_to :route

      t.timestamps
    end
  end
end
