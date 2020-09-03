class CreateLivestreams < ActiveRecord::Migration[5.2]
  def change
    create_table :livestreams do |t|
      t.string :title
      t.text :description
      t.datetime :data
      t.time :hora
      t.string :image
      t.string :youtube
      t.string :instagram
      t.string :facebook
      t.boolean :published, default: false
      t.boolean :highlight, default: false
      t.references :genre, foreign_key: true

      t.timestamps
    end
  end
end
