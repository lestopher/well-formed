class FormObject < ActiveRecord::Base
  belongs_to :form
  attr_accessible :form_type, :form_id, :validations

end
