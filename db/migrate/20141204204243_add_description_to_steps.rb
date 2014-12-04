class AddDescriptionToSteps < ActiveRecord::Migration
  def change
    rename_column :steps, :description, :notes
    add_column :steps, :description, :string

    Step.all.each do |s|
      s.description = s.notes
      s.save
    end

    change_column :steps, :description, :string, null: false
  end
end
