class SpecifyNonNullFieldsInSteps < ActiveRecord::Migration
  def change
    change_column :steps, :number, :integer, null: false
  end
end
