class CreateCarriages < ActiveRecord::Migration[5.1]
  def change
    create_table :carriages do |t|
      t.integer :kind
      t.integer :top_seats, default: 0
      t.integer :low_seats, default: 0

      t.belongs_to :train

      t.timestamps
    end
  end
end
