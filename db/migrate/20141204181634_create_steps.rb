class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :number
      t.text :description
      t.references :candidate, index: true, null: false
      t.references :owner, index: true, null: false

      t.timestamps
    end
  end
end
