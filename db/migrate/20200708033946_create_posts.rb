class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :name, null: false
      t.text :text, null: false
      t.text :image
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
