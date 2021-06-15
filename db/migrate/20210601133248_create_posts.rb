class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :genre_id
      t.integer :price
      t.string :image_id
      t.string :name
      t.string :title
      t.text :body
      t.integer :storage
      t.integer :expired

      t.timestamps
    end
  end
end
