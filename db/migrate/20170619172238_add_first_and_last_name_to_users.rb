class AddFirstAndLastNameToUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.column :first_name, :string
      t.column :last_name, :string
    end
  end
end
