class CreateLiveArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :live_artists do |t|
      t.references :artist, foreign_key: true
      t.references :livestream, foreign_key: true

      t.timestamps
    end
  end
end
