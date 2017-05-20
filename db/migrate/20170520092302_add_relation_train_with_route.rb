class AddRelationTrainWithRoute < ActiveRecord::Migration[5.1]
  def change
    add_reference :trains, :route
  end
end
