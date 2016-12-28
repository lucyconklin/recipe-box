class CreateDirections < ActiveRecord::Migration[5.0]
  def change
    create_table :directions do |t|
      t.text :description
      t.references :recipe, index: true

      t.timestamps null: false
    end
  end
end
