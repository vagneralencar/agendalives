class CreateLives < ActiveRecord::Migration[5.2]
  def change
    create_table :lives do |t|
      t.text :description
      t.string :image
      t.string :youtube
      t.string :instagram
      t.string :facebook
      t.references :genre, foreign_key: true
      t.boolean :published, default: false
      t.boolean :highlight, default:false

      t.timestamps
    end
  end
end
