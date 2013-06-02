class CreateFormObjects < ActiveRecord::Migration
  def change
    create_table :form_objects do |t|
      t.string :title
      t.string :form_type
      t.string :validations
      t.integer :form_id
      t.timestamps
    end
  end
end
