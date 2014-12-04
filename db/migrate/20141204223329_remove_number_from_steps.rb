class RemoveNumberFromSteps < ActiveRecord::Migration
  def change
    remove_column :steps, :number, :integer
  end
end
