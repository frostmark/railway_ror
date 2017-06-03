class AddStiToCarriages < ActiveRecord::Migration[5.1]
  def change
    remove_column :carriages, :kind, :integer

    add_column :carriages, :type, :string
    add_column :carriages, :side_top_seats, :integer, default: 0
    add_column :carriages, :side_low_seats, :integer, default: 0
    add_column :carriages, :sedentary_seats, :integer, default: 0
  end
end
