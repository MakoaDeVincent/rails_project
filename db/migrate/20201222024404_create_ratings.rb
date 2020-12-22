class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.string :score
      t.string :comments

      t.timestamps
    end
  end
end
