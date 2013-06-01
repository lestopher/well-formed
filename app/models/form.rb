class Form < ActiveRecord::Base
  has_many :form_objects
  accepts_nested_attributes_for :form_objects, :allow_destroy => true

  attr_accessible :title
end
