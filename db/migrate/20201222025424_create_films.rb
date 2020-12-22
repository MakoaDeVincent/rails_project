class CreateFilms < ActiveRecord::Migration[6.0]
  def change
    create_table :films do |t|
      t.string :name
      t.string :iso
      t.boolean :expired
      t.integer :user_id
      t.integer :rating_id

      t.timestamps
    end
  end
end
