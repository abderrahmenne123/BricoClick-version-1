class Demandes < ActiveRecord::Migration[6.0]
  def change
    create_table :demandes do |t|
      t.text :body
      t.string :status, default: "encours"
     t.references :conversatdemande, index: true
     t.references :user, index: true
     t.timestamps
    end
  end
end

