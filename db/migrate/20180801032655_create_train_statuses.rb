class CreateTrainStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :train_statuses do |t|
      t.text :message

      t.timestamps
    end
  end
end
