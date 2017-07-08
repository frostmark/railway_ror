class AddIndexesToCarriage < ActiveRecord::Migration[5.1]
  def change
    add_index :carriages, [:train_id, :type]
  end
end
