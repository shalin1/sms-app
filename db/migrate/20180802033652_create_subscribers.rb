class CreateSubscribers < ActiveRecord::Migration[5.2]
  def change
    create_table :subscribers do |t|
      t.string :phone_number
      t.boolean :subscribed

      t.timestamps
    end
  end
end
