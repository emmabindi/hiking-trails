class CreateFacilityTrails < ActiveRecord::Migration[6.0]
  def change
    create_table :facility_trails do |t|
      t.references :facility, null: false, foreign_key: true
      t.references :trail, null: false, foreign_key: true

      t.timestamps
    end
  end
end
