class CreateFormObjects < ActiveRecord::Migration
  def change
    create_table :form_objects do |t|
      t.string :title
      t.timestamps
    end
  end
end
