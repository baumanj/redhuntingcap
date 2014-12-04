class SpecifyNonNullFieldsInCandidates < ActiveRecord::Migration
  def change
    change_column :candidates, :name, :string, null: false
    change_column :candidates, :email, :string, null: false
    change_column :candidates, :phone, :string, null: false
    change_column :candidates, :resume_url, :string, null: false
    change_column :candidates, :intro, :text, null: false
    change_column :candidates, :recruiter_id, :integer, null: false
    change_column :candidates, :owner_id, :integer, null: false
  end
end
