class CreateArtistLives < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_lives do |t|
      t.references :livestream, foreign_key: true
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
