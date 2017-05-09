class CreateRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :routes do |t|
      t.string :name, nil: false
      t.timestamps
    end
  end
end
