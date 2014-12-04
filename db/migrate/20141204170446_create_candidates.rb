class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :resume_url
      t.text :intro
      t.references :recruiter, index: true
      t.references :owner, index: true

      t.timestamps
    end
    add_index :candidates, :name, unique: true
    add_index :candidates, :email, unique: true
    add_index :candidates, :phone, unique: true
    add_index :candidates, :resume_url, unique: true
  end
end
