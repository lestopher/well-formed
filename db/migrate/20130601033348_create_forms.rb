class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :title
      t.string :form_type
      t.integer :form_id
      t.timestamps
    end
  end
end
