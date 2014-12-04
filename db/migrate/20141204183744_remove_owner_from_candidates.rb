class RemoveOwnerFromCandidates < ActiveRecord::Migration
  def change
    remove_reference :candidates, :owner, index: true
  end
end
