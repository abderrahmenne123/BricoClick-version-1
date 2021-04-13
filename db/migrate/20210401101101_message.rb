class Message < ActiveRecord::Migration[6.0]
  def change
    create_table :message do |t|
      t.text :body
      t.references :conversation, index: true
      t.references :user, index: true
      t.timestamps
    end
  end
end
