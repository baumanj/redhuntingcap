class RemoveIntroFromCandidates < ActiveRecord::Migration
  def change
    remove_column :candidates, :intro, :text
  end
end
