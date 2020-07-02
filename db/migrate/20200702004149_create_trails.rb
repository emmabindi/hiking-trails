class CreateTrails < ActiveRecord::Migration[6.0]
  def change
    create_table :trails do |t|
      t.string :name
      t.integer :distance
      t.string :location
      t.integer :difficulty

      t.timestamps
    end
  end
end
