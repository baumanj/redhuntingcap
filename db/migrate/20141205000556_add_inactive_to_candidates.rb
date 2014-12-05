class AddInactiveToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :inactive, :boolean, default: false, null: false
  end
end
