class CreateTextMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :text_messages do |t|
      t.string :to
      t.text :body

      t.timestamps
    end
  end
end
