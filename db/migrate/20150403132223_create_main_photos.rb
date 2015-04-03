class CreateMainPhotos < ActiveRecord::Migration
  def change
    create_table :main_photos do |t|
      t.string :image
      t.integer :article_id

      t.timestamps null: false
    end
  end
end
