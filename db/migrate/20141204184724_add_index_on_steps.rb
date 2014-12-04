class AddIndexOnSteps < ActiveRecord::Migration
  def change
    add_index :steps, [:candidate_id, :number], unique: true
  end
end
