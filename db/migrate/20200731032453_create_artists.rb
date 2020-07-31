class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name, null: false
      t.string :image
      t.string :facebook
      t.string :instagram
      t.string :youtube
      t.references :genre, foreign_key: true

      t.timestamps
    end
  end
end
